#ifndef TEST_LSPTEST_H
#define TEST_LSPTEST_H

#include "gtest/gtest.h"
// ^ Violates linting rules, so include first.

#include "spdlog/sinks/stdout_color_sinks.h"
#include "test/expectations.h"
#include "test/position_assertions.h"

#include <sstream>

using namespace sorbet::realmain::lsp;

/**
 * Parameterized GTest test pattern for LSP. Handles parsing the test file, initializing LSP,
 * feeding messages to it, and receiving messages from it.
 */
class LSPTest : public testing::TestWithParam<Expectations> {
private:
    /** The LSP 'server', which runs in the same thread as the tests. */
    std::unique_ptr<LSPLoop> lspLoop;

    /**
     * Required objects that Sorbet assumes we 'own'. Not having these here would result in memory errors, as Sorbet
     * captures references to them. Normally these are stack allocated, but we cannot do that with gtests which
     * implicitly call `SetUp()`.
     */
    std::shared_ptr<spd::logger> logger;
    std::shared_ptr<spd::logger> typeErrorsConsole;
    sorbet::realmain::options::Options opts;
    std::shared_ptr<spd::sinks::ansicolor_stderr_sink_mt> stderrColorSink;
    std::unique_ptr<WorkerPool> workers;

    /** The output stream used by LSP. Lets us drain all response messages after sending messages to LSP. */
    std::stringstream lspOstream;

    /** Parses the given LSP message string into a NotificationMessage or ResponseMessage. If parsing fails, adds an
     * error to the currently running test. */
    std::optional<unique_ptr<JSONDocument<JSONBaseType>>> parseLSPResponse(std::string raw);

    /** Sends the given string directly to Sorbet's LSP component, and returns any response messages. */
    std::vector<unique_ptr<JSONDocument<JSONBaseType>>> sendRaw(std::string json);

    /**
     * filename -> contents of a test file split by line.
     * Used to pretty print error messages. Lazily populated.
     */
    sorbet::UnorderedMap<string, std::vector<std::string>> sourceLines;

    /** Parses the test file and its assertions. */
    void parseTestFile();

    /** Starts up the LSP 'server'. */
    void startLSP();

protected:
    /** Parses test file and initializes LSP */
    void SetUp() override;

    void TearDown() override {}

public:
    /** filename -> raw contents of a test file */
    sorbet::UnorderedMap<string, string> fileContents;

    /** The path to the test Ruby files on disk */
    sorbet::UnorderedSet<string> filenames;

    /** All test assertions ordered by (filename, range, message). */
    std::vector<std::shared_ptr<RangeAssertion>> assertions;

    /**
     * Send a RequestMessage to LSP, and returns any responses.
     */
    vector<unique_ptr<JSONDocument<JSONBaseType>>> sendRequest(const unique_ptr<RequestMessage> &message);

    /**
     * Send a Notification to LSP, and returns any responses.
     */
    vector<unique_ptr<JSONDocument<JSONBaseType>>> sendNotification(const unique_ptr<NotificationMessage> &message);

    /**
     * Returns all error assertions, which are expected to match diagnostic messages.
     * Ordered in (filename, range, message) order.
     */
    vector<shared_ptr<ErrorAssertion>> getErrorAssertions();

    /**
     * Given a filename and a 0-indexed line number, returns the source line.
     */
    std::string getSourceLine(const std::string &filename, int line);
};

#endif // TEST_LSPTEST_H