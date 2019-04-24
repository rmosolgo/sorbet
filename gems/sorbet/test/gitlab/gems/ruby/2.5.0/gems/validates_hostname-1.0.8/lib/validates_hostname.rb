require 'active_support/concern'
require 'active_record'
require 'active_model'

module PAK
  module ValidatesHostname
    autoload :VERSION, 'validates_hostname/version'

    # List from IANA: http://www.iana.org/domains/root/db/
    #                 http://data.iana.org/TLD/tlds-alpha-by-domain.txt
    ALLOWED_TLDS = %w(
      . aaa aarp abarth abb abbott abbvie abc able abogado abudhabi ac academy
      accenture accountant accountants aco active actor ad adac ads adult ae aeg
      aero aetna af afamilycompany afl africa ag agakhan agency ai aig aigo airbus
      airforce airtel akdn al alfaromeo alibaba alipay allfinanz allstate ally
      alsace alstom am americanexpress americanfamily amex amfam amica amsterdam
      analytics android anquan anz ao aol apartments app apple aq aquarelle ar
      aramco archi army arpa art arte as asda asia associates at athleta attorney
      au auction audi audible audio auspost author auto autos avianca aw aws ax
      axa az azure ba baby baidu banamex bananarepublic band bank bar barcelona
      barclaycard barclays barefoot bargains baseball basketball bauhaus bayern bb
      bbc bbt bbva bcg bcn bd be beats beauty beer bentley berlin best bestbuy bet
      bf bg bh bharti bi bible bid bike bing bingo bio biz bj black blackfriday
      blanco blockbuster blog bloomberg blue bm bms bmw bn bnl bnpparibas bo boats
      boehringer bofa bom bond boo book booking boots bosch bostik boston bot
      boutique box br bradesco bridgestone broadway broker brother brussels bs bt
      budapest bugatti build builders business buy buzz bv bw by bz bzh ca cab
      cafe cal call calvinklein cam camera camp cancerresearch canon capetown
      capital capitalone car caravan cards care career careers cars cartier casa
      case caseih cash casino cat catering catholic cba cbn cbre cbs cc cd ceb
      center ceo cern cf cfa cfd cg ch chanel channel chase chat cheap chintai
      chloe christmas chrome chrysler church ci cipriani circle cisco citadel citi
      citic city cityeats ck cl claims cleaning click clinic clinique clothing
      cloud club clubmed cm cn co coach codes coffee college cologne com comcast
      commbank community company compare computer comsec condos construction
      consulting contact contractors cooking cookingchannel cool coop corsica
      country coupon coupons courses cr credit creditcard creditunion cricket
      crown crs cruise cruises csc cu cuisinella cv cw cx cy cymru cyou cz dabur
      dad dance data date dating datsun day dclk dds de deal dealer deals degree
      delivery dell deloitte delta democrat dental dentist desi design dev dhl
      diamonds diet digital direct directory discount discover dish diy dj dk dm
      dnp do docs doctor dodge dog doha domains dot download drive dtv dubai duck
      dunlop duns dupont durban dvag dvr dz earth eat ec eco edeka edu education
      ee eg email emerck energy engineer engineering enterprises epost epson
      equipment er ericsson erni es esq estate esurance et eu eurovision eus
      events everbank exchange expert exposed express extraspace fage fail
      fairwinds faith family fan fans farm farmers fashion fast fedex feedback
      ferrari ferrero fi fiat fidelity fido film final finance financial fire
      firestone firmdale fish fishing fit fitness fj fk flickr flights flir
      florist flowers fly fm fo foo food foodnetwork football ford forex forsale
      forum foundation fox fr free fresenius frl frogans frontdoor frontier ftr
      fujitsu fujixerox fun fund furniture futbol fyi ga gal gallery gallo gallup
      game games gap garden gb gbiz gd gdn ge gea gent genting george gf gg ggee
      gh gi gift gifts gives giving gl glade glass gle global globo gm gmail gmbh
      gmo gmx gn godaddy gold goldpoint golf goo goodhands goodyear goog google
      gop got gov gp gq gr grainger graphics gratis green gripe group gs gt gu
      guardian gucci guge guide guitars guru gw gy hair hamburg hangout haus hbo
      hdfc hdfcbank health healthcare help helsinki here hermes hgtv hiphop
      hisamitsu hitachi hiv hk hkt hm hn hockey holdings holiday homedepot
      homegoods homes homesense honda honeywell horse hospital host hosting hot
      hoteles hotels hotmail house how hr hsbc ht htc hu hughes hyatt hyundai ibm
      icbc ice icu id ie ieee ifm ikano il im imamat imdb immo immobilien in
      industries infiniti info ing ink institute insurance insure int intel
      international intuit investments io ipiranga iq ir irish is iselect ismaili
      ist istanbul it itau itv iveco iwc jaguar java jcb jcp je jeep jetzt jewelry
      jio jlc jll jm jmp jnj jo jobs joburg jot joy jp jpmorgan jprs juegos
      juniper kaufen kddi ke kerryhotels kerrylogistics kerryproperties kfh kg kh
      ki kia kim kinder kindle kitchen kiwi km kn koeln komatsu kosher kp kpmg kpn
      kr krd kred kuokgroup kw ky kyoto kz la lacaixa ladbrokes lamborghini lamer
      lancaster lancia lancome land landrover lanxess lasalle lat latino latrobe
      law lawyer lb lc lds lease leclerc lefrak legal lego lexus lgbt li liaison
      lidl life lifeinsurance lifestyle lighting like lilly limited limo lincoln
      linde link lipsy live living lixil lk loan loans locker locus loft lol
      london lotte lotto love lpl lplfinancial lr ls lt ltd ltda lu lundbeck lupin
      luxe luxury lv ly ma macys madrid maif maison makeup man management mango
      market marketing markets marriott marshalls maserati mattel mba mc mcd
      mcdonalds mckinsey md me med media meet melbourne meme memorial men menu meo
      metlife mg mh miami microsoft mil mini mint mit mitsubishi mk ml mlb mls mm
      mma mn mo mobi mobile mobily moda moe moi mom monash money monster montblanc
      mopar mormon mortgage moscow moto motorcycles mov movie movistar mp mq mr ms
      msd mt mtn mtpc mtr mu museum mutual mv mw mx my mz na nab nadex nagoya name
      nationwide natura navy nba nc ne nec net netbank netflix network neustar new
      newholland news next nextdirect nexus nf nfl ng ngo nhk ni nico nike nikon
      ninja nissan nissay nl no nokia northwesternmutual norton now nowruz nowtv
      np nr nra nrw ntt nu nyc nz obi observer off office okinawa olayan
      olayangroup oldnavy ollo om omega one ong onl online onyourside ooo open
      oracle orange org organic orientexpress origins osaka otsuka ott ovh pa page
      pamperedchef panasonic panerai paris pars partners parts party passagens pay
      pccw pe pet pf pfizer pg ph pharmacy philips phone photo photography photos
      physio piaget pics pictet pictures pid pin ping pink pioneer pizza pk pl
      place play playstation plumbing plus pm pn pnc pohl poker politie porn post
      pr pramerica praxi press prime pro prod productions prof progressive promo
      properties property protection pru prudential ps pt pub pw pwc py qa qpon
      quebec quest qvc racing radio raid re read realestate realtor realty recipes
      red redstone redumbrella rehab reise reisen reit reliance ren rent rentals
      repair report republican rest restaurant review reviews rexroth rich
      richardli ricoh rightathome ril rio rip rmit ro rocher rocks rodeo rogers
      room rs rsvp ru rugby ruhr run rw rwe ryukyu sa saarland safe safety sakura
      sale salon samsclub samsung sandvik sandvikcoromant sanofi sap sapo sarl sas
      save saxo sb sbi sbs sc sca scb schaeffler schmidt scholarships school
      schule schwarz science scjohnson scor scot sd se seat secure security seek
      select sener services ses seven sew sex sexy sfr sg sh shangrila sharp shaw
      shell shia shiksha shoes shop shopping shouji show showtime shriram si silk
      sina singles site sj sk ski skin sky skype sl sling sm smart smile sn sncf
      so soccer social softbank software sohu solar solutions song sony soy space
      spiegel spot spreadbetting sr srl srt st stada staples star starhub
      statebank statefarm statoil stc stcgroup stockholm storage store stream
      studio study style su sucks supplies supply support surf surgery suzuki sv
      swatch swiftcover swiss sx sy sydney symantec systems sz tab taipei talk
      taobao target tatamotors tatar tattoo tax taxi tc tci td tdk team tech
      technology tel telecity telefonica temasek tennis teva tf tg th thd theater
      theatre tiaa tickets tienda tiffany tips tires tirol tj tjmaxx tjx tk tkmaxx
      tl tm tmall tn to today tokyo tools top toray toshiba total tours town
      toyota toys tr trade trading training travel travelchannel travelers
      travelersinsurance trust trv tt tube tui tunes tushu tv tvs tw tz ua ubank
      ubs uconnect ug uk unicom university uno uol ups us uy uz va vacations vana
      vanguard vc ve vegas ventures verisign versicherung vet vg vi viajes video
      vig viking villas vin vip virgin visa vision vista vistaprint viva vivo
      vlaanderen vn vodka volkswagen volvo vote voting voto voyage vu vuelos wales
      walmart walter wang wanggou warman watch watches weather weatherchannel
      webcam weber website wed wedding weibo weir wf whoswho wien wiki williamhill
      win windows wine winners wme wolterskluwer woodside work works world wow ws
      wtc wtf xbox xerox xfinity xihuan xin xn--11b4c3d xn--1ck2e1b xn--1qqw23a
      xn--30rr7y xn--3bst00m xn--3ds443g xn--3e0b707e xn--3oq18vl8pn36a xn--3pxu8k
      xn--42c2d9a xn--45brj9c xn--45q11c xn--4gbrim xn--54b7fta0cc xn--55qw42g
      xn--55qx5d xn--5su34j936bgsg xn--5tzm5g xn--6frz82g xn--6qq986b3xl
      xn--80adxhks xn--80ao21a xn--80aqecdr1a xn--80asehdb xn--80aswg xn--8y0a063a
      xn--90a3ac xn--90ae xn--90ais xn--9dbq2a xn--9et52u xn--9krt00a
      xn--b4w605ferd xn--bck1b9a5dre4c xn--c1avg xn--c2br7g xn--cck2b3b xn--cg4bki
      xn--clchc0ea0b2g2a9gcd xn--czr694b xn--czrs0t xn--czru2d xn--d1acj3b
      xn--d1alf xn--e1a4c xn--eckvdtc9d xn--efvy88h xn--estv75g xn--fct429k
      xn--fhbei xn--fiq228c5hs xn--fiq64b xn--fiqs8s xn--fiqz9s xn--fjq720a
      xn--flw351e xn--fpcrj9c3d xn--fzc2c9e2c xn--fzys8d69uvgm xn--g2xx48c
      xn--gckr3f0f xn--gecrj9c xn--gk3at1e xn--h2brj9c xn--hxt814e xn--i1b6b1a6a2e
      xn--imr513n xn--io0a7i xn--j1aef xn--j1amh xn--j6w193g xn--jlq61u9w7b
      xn--jvr189m xn--kcrx77d1x4a xn--kprw13d xn--kpry57d xn--kpu716f xn--kput3i
      xn--l1acc xn--lgbbat1ad8j xn--mgb9awbf xn--mgba3a3ejt xn--mgba3a4f16a
      xn--mgba7c0bbn0a xn--mgbaam7a8h xn--mgbab2bd xn--mgbai9azgqp6j
      xn--mgbayh7gpa xn--mgbb9fbpob xn--mgbbh1a71e xn--mgbc0a9azcg xn--mgbca7dzdo
      xn--mgberp4a5d4ar xn--mgbi4ecexp xn--mgbpl2fh xn--mgbt3dhd xn--mgbtx2b
      xn--mgbx4cd0ab xn--mix891f xn--mk1bu44c xn--mxtq1m xn--ngbc5azd xn--ngbe9e0a
      xn--node xn--nqv7f xn--nqv7fs00ema xn--nyqy26a xn--o3cw4h xn--ogbpf8fl
      xn--p1acf xn--p1ai xn--pbt977c xn--pgbs0dh xn--pssy2u xn--q9jyb4c
      xn--qcka1pmc xn--qxam xn--rhqv96g xn--rovu88b xn--s9brj9c xn--ses554g
      xn--t60b56a xn--tckwe xn--tiq49xqyj xn--unup4y xn--vermgensberater-ctb
      xn--vermgensberatung-pwb xn--vhquv xn--vuq861b xn--w4r85el8fhu5dnra
      xn--w4rs40l xn--wgbh1c xn--wgbl6a xn--xhq521b xn--xkc2al3hye2a
      xn--xkc2dl3a5ee0h xn--y9a3aq xn--yfro4i67o xn--ygbi2ammx xn--zfr164b xperia
      xxx xyz yachts yahoo yamaxun yandex ye yodobashi yoga yokohama you youtube
      yt yun za zappos zara zero zip zippo zm zone zuerich zw
    )

    DEFAULT_ERROR_MSG = {
      :invalid_hostname_length            => 'must be between 1 and 255 characters long',
      :invalid_label_length               => 'must be between 1 and 63 characters long',
      :label_begins_or_ends_with_hyphen   => 'begins or ends with hyphen',
      :label_contains_invalid_characters  => "contains invalid characters (valid characters: [%{valid_chars}])",
      :hostname_label_is_numeric          => 'unqualified hostname part cannot consist of numeric values only',
      :hostname_is_not_fqdn               => 'is not a fully qualified domain name',
      :single_numeric_hostname_label      => 'cannot consist of a single numeric label',
      :hostname_contains_consecutive_dots => 'must not contain consecutive dots',
      :hostname_ends_with_dot             => 'must not end with a dot'
    }.freeze

    class HostnameValidator < ActiveModel::EachValidator
      def initialize(options)
        opts = {
          :allow_underscore        => false,
          :require_valid_tld       => false,
          :valid_tlds              => ALLOWED_TLDS,
          :allow_numeric_hostname  => false,
          :allow_wildcard_hostname => false,
          :allow_root_label        => false
        }.merge(options)
        super(opts)
      end

      def validate_each(record, attribute, value)
        value ||= ''

        # maximum hostname length: 255 characters
        add_error(record, attribute, :invalid_hostname_length) unless value.length.between?(1, 255)

        # split each hostname into labels and do various checks
        if value.is_a?(String)
          labels = value.split '.'
          labels.each_with_index do |label, index|
            # CHECK 1: hostname label cannot be longer than 63 characters
            add_error(record, attribute, :invalid_label_length) unless label.length.between?(1, 63)

            # CHECK 2: hostname label cannot begin or end with hyphen
            add_error(record, attribute, :label_begins_or_ends_with_hyphen) if label =~ /^[-]/i or label =~ /[-]$/

            # Take care of wildcard first label
            next if options[:allow_wildcard_hostname] and label == '*' and index == 0

            # CHECK 3: hostname can only contain characters:
            #          a-z, 0-9, hyphen, optional underscore, optional asterisk
            valid_chars = 'a-z0-9\-'
            valid_chars << '_' if options[:allow_underscore] == true
            add_error(record, attribute, :label_contains_invalid_characters, :valid_chars => valid_chars) unless label =~ /^[#{valid_chars}]+$/i
          end

          # CHECK 4: the unqualified hostname portion cannot consist of
          #          numeric values only
          if options[:allow_numeric_hostname] == false and labels.length > 0
            is_numeric_only = labels[0] =~ /\A\d+\z/
            add_error(record, attribute, :hostname_label_is_numeric) if is_numeric_only
          end

          # CHECK 5: in order to be fully qualified, the full hostname's
          #          TLD must be valid
          if options[:require_valid_tld] == true
            my_tld = value == '.' ? value : labels.last
            my_tld ||= ''
            has_tld = options[:valid_tlds].select {
              |tld| tld =~ /^#{Regexp.escape(my_tld)}$/i
            }.empty? ? false : true
            add_error(record, attribute, :hostname_is_not_fqdn) unless has_tld
          end

          # CHECK 6: hostname may not contain consecutive dots
          if value =~ /\.\./
            add_error(record, attribute, :hostname_contains_consecutive_dots)
          end

          # CHECK 7: do not allow trailing dot unless option is set
          if options[:allow_root_label] == false
            if value =~ /\.$/
              add_error(record, attribute, :hostname_ends_with_dot)
            end
          end
        end
      end

      def add_error(record, attr_name, message, *interpolators)
        args = {
          :default => [DEFAULT_ERROR_MSG[message], options[:message]],
          :scope   => [:errors, :messages]
        }.merge(interpolators.last.is_a?(Hash) ? interpolators.pop : {})
        record.errors.add(attr_name, I18n.t( message, args ))
      end
    end

    class DomainnameValidator < HostnameValidator
      def initialize(options)
        opts = {
          :require_valid_tld       => true,
          :allow_numeric_hostname  => true
        }.merge(options)
        super(opts)
      end

      def validate_each(record, attribute, value)
        super

        if value.is_a?(String)
          labels = value.split '.'
          labels.each do |label|
            # CHECK 1: if there is only one label it cannot be numeric even
            #          though numeric hostnames are allowed
            if options[:allow_numeric_hostname] == true
              is_numeric_only = labels[0] =~ /\A\d+\z/
              if is_numeric_only and labels.size == 1
                add_error(record, attribute, :single_numeric_hostname_label)
              end
            end
          end
        end
      end

      def add_error(record, attr_name, message, *interpolators)
        args = {
          :default => [DEFAULT_ERROR_MSG[message], options[:message]],
          :scope   => [:errors, :messages]
        }.merge(interpolators.last.is_a?(Hash) ? interpolators.pop : {})
        record.errors.add(attr_name, I18n.t( message, args ))
      end
    end

    class FqdnValidator < HostnameValidator
      def initialize(options)
        opts = {
          :require_valid_tld       => true,
        }.merge(options)
        super(opts)
      end
    end

    class WildcardValidator < HostnameValidator
      def initialize(options)
        opts = {
          :allow_wildcard_hostname => true,
        }.merge(options)
        super(opts)
      end
    end
  end
end

ActiveRecord::Base.send(:include, PAK::ValidatesHostname)
