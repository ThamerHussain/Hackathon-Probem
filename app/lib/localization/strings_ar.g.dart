///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsAr = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ar: 'نموذج مشروع المنصة'
	String get appTitle => 'نموذج مشروع المنصة';

	/// ar: 'تسجيل الدخول إلى حسابك'
	String get loginTitle => 'تسجيل الدخول\nإلى حسابك';

	/// ar: 'أدخل بريدك الإلكتروني الخاص بالعمل وكلمة المرور لتسجيل الدخول'
	String get loginSubtitle => 'أدخل بريدك الإلكتروني الخاص بالعمل وكلمة المرور لتسجيل الدخول';

	/// ar: 'البريد الإلكتروني'
	String get email => 'البريد الإلكتروني';

	/// ar: 'أدخل البريد الإلكتروني'
	String get enterEmail => 'أدخل البريد الإلكتروني';

	/// ar: 'كلمة المرور'
	String get password => 'كلمة المرور';

	/// ar: 'أدخل كلمة المرور'
	String get enterPassword => 'أدخل كلمة المرور';

	/// ar: 'تسجيل الدخول'
	String get login => 'تسجيل الدخول';

	/// ar: 'تم إلغاء الطلب'
	String get request_cancelled => 'تم إلغاء الطلب';

	/// ar: 'انتهت مهلة الاتصال'
	String get connection_timeout => 'انتهت مهلة الاتصال';

	/// ar: 'انتهت مهلة استلام البيانات'
	String get receive_timeout => 'انتهت مهلة استلام البيانات';

	/// ar: 'انتهت مهلة إرسال البيانات'
	String get send_timeout => 'انتهت مهلة إرسال البيانات';

	/// ar: 'لا يوجد اتصال بالإنترنت'
	String get no_internet => 'لا يوجد اتصال بالإنترنت';

	/// ar: 'لم يتم العثور على بيانات الاستجابة'
	String get response_data_not_found => 'لم يتم العثور على بيانات الاستجابة';

	/// ar: 'حدث خطأ غير متوقع'
	String get unexpected_error => 'حدث خطأ غير متوقع';

	/// ar: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'
	String get default_error_message => 'حدث خطأ ما، يرجى المحاولة مرة أخرى';

	/// ar: 'طلب غير صالح'
	String get bad_request => 'طلب غير صالح';

	/// ar: 'دخول غير مصرح به'
	String get unauthorized => 'دخول غير مصرح به';

	/// ar: 'الدخول مرفوض'
	String get error_403_forbidden => 'الدخول مرفوض';

	/// ar: 'العنصر المطلوب غير موجود'
	String get error_404_not_found => 'العنصر المطلوب غير موجود';

	/// ar: 'انتهت صلاحية الجلسة'
	String get session_expired => 'انتهت صلاحية الجلسة';

	/// ar: 'خطأ في الخادم الداخلي'
	String get internal_server_error => 'خطأ في الخادم الداخلي';

	/// ar: 'الخادم غير متوفر'
	String get server_unavailable => 'الخادم غير متوفر';

	/// ar: 'حدث خطأ ما'
	String get something_went_wrong => 'حدث خطأ ما';

	/// ar: 'حدث خطأ غير معروف.'
	String get unknownError => 'حدث خطأ غير معروف.';

	/// ar: 'خطأ في الاتصال. يرجى التحقق من الإنترنت.'
	String get connectionError => 'خطأ في الاتصال. يرجى التحقق من الإنترنت.';

	/// ar: 'بيانات الاعتماد غير صحيحة. يرجى المحاولة مرة أخرى.'
	String get invalidCredentials => 'بيانات الاعتماد غير صحيحة. يرجى المحاولة مرة أخرى.';

	/// ar: 'هذا البريد الإلكتروني مستخدم بالفعل.'
	String get usedEmail => 'هذا البريد الإلكتروني مستخدم بالفعل.';

	/// ar: 'الرجاء إعادة تسجيل الدخول'
	String get needAuth => 'الرجاء إعادة تسجيل الدخول';

	/// ar: 'المواصلة'
	String get proceed => 'المواصلة';

	/// ar: 'تم إنتهاء الجلسة.'
	String get loginExpired => 'تم إنتهاء الجلسة.';

	/// ar: 'فشل تسجيل الدخول باستخدام Google.'
	String get failedGoogleAuth => 'فشل تسجيل الدخول باستخدام Google.';

	/// ar: 'إعادة المحاولة'
	String get retry => 'إعادة المحاولة';

	late final TranslationsHomePageAr homePage = TranslationsHomePageAr._(_root);

	/// ar: '(zero) {موسم} (one) {موسم} (two) {موسمين} (few) {مواسم} (many) {موسم} (other) {موسم}'
	String seasons({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		zero: 'موسم',
		one: 'موسم',
		two: 'موسمين',
		few: 'مواسم',
		many: 'موسم',
		other: 'موسم',
	);

	late final TranslationsProfileAr profile = TranslationsProfileAr._(_root);

	/// ar: 'تسجيل الخروج؟'
	String get loggingOut => 'تسجيل الخروج؟';

	/// ar: 'هل أنت متأكد أنك تريد تسجيل الخروج من المنصة؟'
	String get logoutConfirmation => 'هل أنت متأكد أنك تريد تسجيل الخروج من المنصة؟';

	/// ar: 'تسجيل الخروج'
	String get logout => 'تسجيل الخروج';

	/// ar: 'إلغاء'
	String get cancel => 'إلغاء';

	late final TranslationsAuthAr auth = TranslationsAuthAr._(_root);
	late final TranslationsNavigationAr navigation = TranslationsNavigationAr._(_root);
	late final TranslationsSearchPageAr searchPage = TranslationsSearchPageAr._(_root);
	late final TranslationsContentTypesAr contentTypes = TranslationsContentTypesAr._(_root);
	late final TranslationsHomeSliderAr homeSlider = TranslationsHomeSliderAr._(_root);
	late final TranslationsHomeTabsAr homeTabs = TranslationsHomeTabsAr._(_root);
	late final TranslationsSectionsAr sections = TranslationsSectionsAr._(_root);
	late final TranslationsEpisodesAr episodes = TranslationsEpisodesAr._(_root);

	/// ar: 'مباشر'
	String get live => 'مباشر';

	late final TranslationsSplashAr splash = TranslationsSplashAr._(_root);
	late final TranslationsExploreAr explore = TranslationsExploreAr._(_root);
	late final TranslationsDiagnosticsAr diagnostics = TranslationsDiagnosticsAr._(_root);
	late final TranslationsHiddenActionsAr hiddenActions = TranslationsHiddenActionsAr._(_root);
	late final TranslationsErrorMessageAr errorMessage = TranslationsErrorMessageAr._(_root);
	late final TranslationsSubscriptionAr subscription = TranslationsSubscriptionAr._(_root);
}

// Path: homePage
class TranslationsHomePageAr {
	TranslationsHomePageAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomePageMatchesAr matches = TranslationsHomePageMatchesAr._(_root);
}

// Path: profile
class TranslationsProfileAr {
	TranslationsProfileAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'إعدادات الحساب'
	String get accountSettings => 'إعدادات الحساب';

	/// ar: 'الاشتراك'
	String get subscription => 'الاشتراك';

	/// ar: 'القسائم'
	String get vouchers => 'القسائم';

	/// ar: 'اللغة'
	String get language => 'اللغة';

	/// ar: 'سياسة الخصوصية'
	String get privacyPolicy => 'سياسة الخصوصية';

	/// ar: 'خيارات ضامن الجودة'
	String get hiddenActions => 'خيارات ضامن الجودة';

	/// ar: 'اختر اللغة'
	String get chooseLanguage => 'اختر اللغة';

	/// ar: 'عربي'
	String get arabic => 'عربي';

	/// ar: 'English'
	String get english => 'English';
}

// Path: auth
class TranslationsAuthAr {
	TranslationsAuthAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'اكتشف المنصة—بوابتك إلى الترفيه المتميز!'
	String get mainDescription => 'اكتشف المنصة—بوابتك\nإلى الترفيه المتميز!';

	/// ar: 'أفلام • مسلسلات • مباريات'
	String get subDescription => 'أفلام • مسلسلات • مباريات';

	/// ar: 'قادم في 8 مارس'
	String get releaseDate => 'قادم في 8 مارس';

	/// ar: 'إنشاء حساب'
	String get signUp => 'إنشاء حساب';

	/// ar: 'لديك حساب بالفعل؟ '
	String get alreadyHaveAccount => 'لديك حساب بالفعل؟ ';

	/// ar: 'فشل في المصادقة يرجى المحاولة مرة أخرى'
	String get authenticationFailed => 'فشل في المصادقة يرجى المحاولة مرة أخرى';
}

// Path: navigation
class TranslationsNavigationAr {
	TranslationsNavigationAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الرئيسية'
	String get home => 'الرئيسية';

	/// ar: 'استكشاف'
	String get explore => 'استكشاف';

	/// ar: 'البحث'
	String get search => 'البحث';

	/// ar: 'الملف الشخصي'
	String get profile => 'الملف الشخصي';
}

// Path: searchPage
class TranslationsSearchPageAr {
	TranslationsSearchPageAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'بحث'
	String get search => 'بحث';

	/// ar: 'لم يتم العثور على نتائج'
	String get noResultsFound => 'لم يتم العثور على نتائج';

	/// ar: 'نتائج تم العثور عليها'
	String get resultsFound => 'نتائج تم العثور عليها';

	/// ar: 'أفضل النتائج'
	String get topResults => 'أفضل النتائج';

	/// ar: 'أفلام'
	String get movies => 'أفلام';

	/// ar: 'مسلسلات'
	String get tvShows => 'مسلسلات';

	/// ar: 'القنوات التلفزيونية'
	String get tvChannels => 'القنوات\nالتلفزيونية';

	/// ar: 'المباريات'
	String get matches => 'المباريات';

	/// ar: 'رياضة'
	String get catchup => 'رياضة';

	/// ar: 'تصفح'
	String get browse => 'تصفح';

	/// ar: 'فشل البحث. يرجى المحاولة مرة أخرى.'
	String get searchFailed => 'فشل البحث. يرجى المحاولة مرة أخرى.';

	/// ar: 'غير معروف'
	String get unknown => 'غير معروف';
}

// Path: contentTypes
class TranslationsContentTypesAr {
	TranslationsContentTypesAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'أفلام'
	String get movie => 'أفلام';

	/// ar: 'مسلسلات'
	String get series => 'مسلسلات';

	/// ar: 'رياضة'
	String get catchup => 'رياضة';

	/// ar: 'رياضة'
	String get sport => 'رياضة';

	/// ar: 'وثائقي'
	String get documentary => 'وثائقي';

	/// ar: 'برامج تلفزيونية'
	String get tvShow => 'برامج تلفزيونية';

	/// ar: 'أخرى'
	String get other => 'أخرى';
}

// Path: homeSlider
class TranslationsHomeSliderAr {
	TranslationsHomeSliderAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'اشترك للمشاهدة'
	String get signUpToWatch => 'اشترك للمشاهدة';

	/// ar: 'شاهد الآن'
	String get watchNow => 'شاهد الآن';
}

// Path: homeTabs
class TranslationsHomeTabsAr {
	TranslationsHomeTabsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الرئيسية'
	String get home => 'الرئيسية';

	/// ar: 'الأفلام'
	String get movies => 'الأفلام';

	/// ar: 'المباريات'
	String get matches => 'المباريات';

	/// ar: 'الموسيقى'
	String get music => 'الموسيقى';

	/// ar: 'القنوات التلفزيونية'
	String get tvChannels => 'القنوات التلفزيونية';
}

// Path: sections
class TranslationsSectionsAr {
	TranslationsSectionsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الفئات'
	String get categories => 'الفئات';

	/// ar: 'القنوات الشائعة'
	String get popularChannels => 'القنوات الشائعة';
}

// Path: episodes
class TranslationsEpisodesAr {
	TranslationsEpisodesAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'حلقة'
	String get episodePrefix => 'حلقة';

	/// ar: 'الحلقة {number}'
	String get episodeNumber => 'الحلقة {number}';

	/// ar: 'الحلقات'
	String get episodes => 'الحلقات';

	/// ar: '* تجريبي'
	String get demo => '* تجريبي';
}

// Path: splash
class TranslationsSplashAr {
	TranslationsSplashAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'حدث خطأ غير معروف، يرجى تحديث التطبيق أو الانتظار حتى يتم إصلاحه'
	String get unknownErrorMessage => 'حدث خطأ غير معروف، يرجى تحديث التطبيق أو الانتظار حتى يتم إصلاحه';

	/// ar: 'إعادة المحاولة الآن'
	String get retryNow => 'إعادة المحاولة الآن';

	/// ar: 'الخطأ: '
	String get errorPrefix => 'الخطأ: ';
}

// Path: explore
class TranslationsExploreAr {
	TranslationsExploreAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'مستكشف عصبي'
	String get title => 'مستكشف عصبي';

	/// ar: '...جارٍ تحميل تدفقات البيانات'
	String get loadingStreams => '...جارٍ تحميل تدفقات البيانات';

	/// ar: 'خطأ في الاتصال'
	String get connectionError => 'خطأ في الاتصال';

	/// ar: 'فشل في تحميل تدفقات البيانات'
	String get failedToLoadStreams => 'فشل في تحميل تدفقات البيانات';

	/// ar: 'لم يتم العثور على تدفقات بيانات'
	String get noStreamsFound => 'لم يتم العثور على تدفقات بيانات';

	/// ar: 'عدّل المرشحات لاكتشاف المحتوى'
	String get adjustFilters => 'عدّل المرشحات لاكتشاف المحتوى';

	/// ar: 'خطأ في التنقل'
	String get navigationError => 'خطأ في التنقل';

	/// ar: 'بيانات المحتوى غير متوفرة'
	String get contentUnavailable => 'بيانات المحتوى غير متوفرة';

	/// ar: 'بيانات الحلقة غير متوفرة'
	String get episodeUnavailable => 'بيانات الحلقة غير متوفرة';

	/// ar: 'غير معروف'
	String get unknown => 'غير معروف';

	/// ar: 'حلقة غير معروفة'
	String get unknownEpisode => 'حلقة غير معروفة';

	late final TranslationsExploreSummaryAr summary = TranslationsExploreSummaryAr._(_root);
	late final TranslationsExploreFiltersAr filters = TranslationsExploreFiltersAr._(_root);
	late final TranslationsExploreEpisodesAr episodes = TranslationsExploreEpisodesAr._(_root);
	late final TranslationsExploreInfoAr info = TranslationsExploreInfoAr._(_root);
}

// Path: diagnostics
class TranslationsDiagnosticsAr {
	TranslationsDiagnosticsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'التشخيص'
	String get title => 'التشخيص';

	/// ar: 'مشاركة السجلات'
	String get shareLogs => 'مشاركة السجلات';

	/// ar: 'إعادة تعيين السجلات'
	String get resetLogs => 'إعادة تعيين السجلات';

	/// ar: 'جارٍ إعداد التشخيص...'
	String get preparingDiagnostics => 'جارٍ إعداد التشخيص...';

	/// ar: 'خطأ في تحميل التشخيص'
	String get errorLoadingDiagnostics => 'خطأ في تحميل التشخيص';

	/// ar: 'إعادة المحاولة'
	String get retry => 'إعادة المحاولة';

	/// ar: 'شارك السجلات ومعلومات الجهاز مع المطور'
	String get shareLogsAndDeviceInfo => 'شارك السجلات ومعلومات الجهاز مع المطور';

	/// ar: 'جارٍ الإعداد...'
	String get preparing => 'جارٍ الإعداد...';

	/// ar: 'مشاركة التشخيص'
	String get shareDiagnostics => 'مشاركة التشخيص';

	/// ar: 'مسح السجلات'
	String get clearLogs => 'مسح السجلات';

	/// ar: 'جارٍ إعداد السجلات...'
	String get preparingLogs => 'جارٍ إعداد السجلات...';

	/// ar: 'سرعة الإنترنت'
	String get internetSpeed => 'سرعة الإنترنت';

	/// ar: 'التحميل'
	String get download => 'التحميل';

	/// ar: 'الرفع'
	String get upload => 'الرفع';

	/// ar: 'جارٍ الاختبار...'
	String get testing => 'جارٍ الاختبار...';

	/// ar: 'اختبار السرعة'
	String get testSpeed => 'اختبار السرعة';

	/// ar: 'تفاصيل التخزين'
	String get storageDetails => 'تفاصيل التخزين';

	/// ar: 'حجم ملف السجل'
	String get logFileSize => 'حجم ملف السجل';

	/// ar: 'امسح السجلات عندما لا تكون مطلوبة لتوفير مساحة التخزين'
	String get clearLogsNote => 'امسح السجلات عندما لا تكون مطلوبة لتوفير مساحة التخزين';

	/// ar: 'إجمالي المسجل'
	String get totalRecorded => 'إجمالي المسجل';

	/// ar: 'سعة التخزين'
	String get storageCapacity => 'سعة التخزين';

	/// ar: 'الملف النشط'
	String get activeFile => 'الملف النشط';

	/// ar: 'تم التحديث'
	String get updated => 'تم التحديث';

	/// ar: 'إعادة تعيين السجلات'
	String get resetLogsTitle => 'إعادة تعيين السجلات';

	/// ar: 'سيؤدي هذا إلى حذف جميع ملفات السجلات والبدء من جديد. هل تريد المتابعة؟'
	String get resetLogsMessage => 'سيؤدي هذا إلى حذف جميع ملفات السجلات والبدء من جديد. هل تريد المتابعة؟';

	/// ar: 'إلغاء'
	String get cancel => 'إلغاء';

	/// ar: 'إعادة تعيين'
	String get reset => 'إعادة تعيين';

	/// ar: 'سجلات التشخيص'
	String get shareLogsSubject => 'سجلات التشخيص';

	late final TranslationsDiagnosticsNetworkStatusAr networkStatus = TranslationsDiagnosticsNetworkStatusAr._(_root);
	late final TranslationsDiagnosticsLogRecordingAr logRecording = TranslationsDiagnosticsLogRecordingAr._(_root);
	late final TranslationsDiagnosticsSpeedTestAr speedTest = TranslationsDiagnosticsSpeedTestAr._(_root);
}

// Path: hiddenActions
class TranslationsHiddenActionsAr {
	TranslationsHiddenActionsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الإجراءات المخفية'
	String get title => 'الإجراءات المخفية';

	/// ar: 'إلى أين تريد الذهاب؟'
	String get subtitle => 'إلى أين تريد الذهاب؟';

	late final TranslationsHiddenActionsExploreAr explore = TranslationsHiddenActionsExploreAr._(_root);
	late final TranslationsHiddenActionsDiagnosticsAr diagnostics = TranslationsHiddenActionsDiagnosticsAr._(_root);
}

// Path: errorMessage
class TranslationsErrorMessageAr {
	TranslationsErrorMessageAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'لا يوجد حلقة تالية للمشاهدة'
	String get noNextEpisode => 'لا يوجد حلقة تالية للمشاهدة';
}

// Path: subscription
class TranslationsSubscriptionAr {
	TranslationsSubscriptionAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الاشتراك'
	String get title => 'الاشتراك';

	/// ar: 'اختر اشتراكك'
	String get chooseYourSubscription => 'اختر اشتراكك';

	/// ar: 'اختر خطتك واستمتع بالمسلسلات والأفلام والقنوات المباشرة.'
	String get chooseYourPlan => 'اختر خطتك واستمتع بالمسلسلات والأفلام والقنوات المباشرة.';

	/// ar: 'اشتراك بلس'
	String get plusSubscription => 'اشتراك بلس';

	/// ar: 'قسيمة'
	String get voucher => 'قسيمة';

	/// ar: 'هل لديك قسيمة؟ أدخل رمز القسيمة لتفعيل خطتك'
	String get voucherDescription => 'هل لديك قسيمة؟ أدخل رمز القسيمة لتفعيل خطتك';

	/// ar: 'متابعة'
	String get continueButton => 'متابعة';

	/// ar: 'اشتراكك'
	String get yourSubscription => 'اشتراكك';

	/// ar: 'إدارة الاشتراك'
	String get manageSubscription => 'إدارة الاشتراك';

	/// ar: 'فتح إدارة الاشتراك...'
	String get openingSubscriptionManagement => 'فتح إدارة الاشتراك...';

	/// ar: 'نشط'
	String get active => 'نشط';

	/// ar: 'ينتهي في: $date'
	TextSpan expiresOn({required InlineSpan date}) => TextSpan(children: [
		const TextSpan(text: 'ينتهي في: '),
		date,
	]);

	/// ar: 'استرد قسيمتك'
	String get redeemYourVoucher => 'استرد قسيمتك';

	/// ar: 'أدخل رمز القسيمة المكون من 16 رقمًا'
	String get enterVoucherCode => 'أدخل رمز القسيمة المكون من 16 رقمًا';

	/// ar: 'من أين يمكنني الحصول على قسيمة؟'
	String get whereCanIGetVoucher => 'من أين يمكنني الحصول على قسيمة؟';

	/// ar: 'اشتر القسائم من موزعينا الموثوقين'
	String get buyVouchersFromResellers => 'اشتر القسائم من موزعينا الموثوقين';

	/// ar: 'شاهد كيفية تفعيل قسيمتك'
	String get watchHowToActivate => 'شاهد كيفية تفعيل قسيمتك';

	/// ar: 'وصول غير محدود للأفلام والمسلسلات والرياضة المباشرة بدون إعلانات.'
	String get unlimitedAccess => 'وصول غير محدود للأفلام والمسلسلات والرياضة المباشرة بدون إعلانات.';

	/// ar: '/شهريًا'
	String get perMonth => '/شهريًا';

	/// ar: 'اشتراك قسيمة'
	String get voucherSubscription => 'اشتراك قسيمة';
}

// Path: homePage.matches
class TranslationsHomePageMatchesAr {
	TranslationsHomePageMatchesAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'المباريات'
	String get title => 'المباريات';

	/// ar: 'لا يوجد مباريات اليوم'
	String get empty => 'لا يوجد مباريات اليوم';

	/// ar: 'مباشر'
	String get live => 'مباشر';

	/// ar: 'قادم'
	String get upcoming => 'قادم';
}

// Path: explore.summary
class TranslationsExploreSummaryAr {
	TranslationsExploreSummaryAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'عرض الكل'
	String get showingAllPrefix => 'عرض الكل';

	/// ar: 'تدفقات'
	String get streams => 'تدفقات';

	/// ar: 'تم التصفية:'
	String get filteredPrefix => 'تم التصفية:';

	/// ar: 'مرشحات محلية'
	String get localFilters => 'مرشحات محلية';

	/// ar: '...تطبيق المرشحات العصبية المحلية'
	String get loadingLocalFilters => '...تطبيق المرشحات العصبية المحلية';

	/// ar: 'تم اكتشاف خطأ في التصفية'
	String get filterErrorDetected => 'تم اكتشاف خطأ في التصفية';

	/// ar: 'مختلط'
	String get mixed => 'مختلط';

	/// ar: 'فيلم'
	String get movie => 'فيلم';

	/// ar: 'مسلسل'
	String get series => 'مسلسل';

	/// ar: 'تسجيل'
	String get recording => 'تسجيل';

	/// ar: 'قناة'
	String get channel => 'قناة';
}

// Path: explore.filters
class TranslationsExploreFiltersAr {
	TranslationsExploreFiltersAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'المرشحات العصبية'
	String get header => 'المرشحات العصبية';

	/// ar: 'نوع المحتوى'
	String get contentType => 'نوع المحتوى';

	/// ar: 'المزودون'
	String get providers => 'المزودون';

	/// ar: 'صيغة البث'
	String get streamFormat => 'صيغة البث';

	/// ar: 'خصائص المحتوى'
	String get contentFeatures => 'خصائص المحتوى';

	/// ar: 'مفعّل'
	String get active => 'مفعّل';

	/// ar: 'إعادة تعيين'
	String get reset => 'إعادة تعيين';

	/// ar: 'أفلام'
	String get movies => 'أفلام';

	/// ar: 'مسلسلات'
	String get series => 'مسلسلات';

	/// ar: 'تسجيلات'
	String get recordings => 'تسجيلات';

	/// ar: 'قنوات'
	String get channels => 'قنوات';

	/// ar: 'متميز'
	String get premium => 'متميز';

	/// ar: 'ملفات MP4 متعددة'
	String get multipleMp4 => 'ملفات MP4 متعددة';

	/// ar: 'غير تكيفي مع ترجمة'
	String get nonAdaptiveWithSubtitles => 'غير تكيفي مع ترجمة';

	/// ar: 'بث واحد فقط'
	String get oneStreamOnly => 'بث واحد فقط';

	/// ar: 'إعادة تعيين كل البيانات'
	String get resetAllData => 'إعادة تعيين كل البيانات';

	/// ar: 'سيتم حذف جميع بيانات الاستكشاف المخزنة والإعدادات نهائيًا. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟'
	String get resetConfirmWithCache => 'سيتم حذف جميع بيانات الاستكشاف المخزنة والإعدادات نهائيًا. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟';

	/// ar: 'لا توجد بيانات مخزنة. ستتم إعادة تعيين أي مرشحات وإعدادات متبقية. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟'
	String get resetConfirmNoCache => 'لا توجد بيانات مخزنة. ستتم إعادة تعيين أي مرشحات وإعدادات متبقية. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟';

	/// ar: 'إعادة تعيين الكل'
	String get resetAll => 'إعادة تعيين الكل';

	/// ar: 'تمت إعادة تعيين بيانات الاستكشاف والمرشحات!'
	String get resetSuccess => 'تمت إعادة تعيين بيانات الاستكشاف والمرشحات!';

	/// ar: 'إعادة تعيين البيانات دون اتصال'
	String get resetOfflineData => 'إعادة تعيين البيانات دون اتصال';

	/// ar: 'جارٍ الإعادة...'
	String get resetting => 'جارٍ الإعادة...';

	/// ar: 'استيراد'
	String get import => 'استيراد';

	/// ar: 'جارٍ الاستيراد...'
	String get importing => 'جارٍ الاستيراد...';

	/// ar: 'تم استيراد بيانات الاستكشاف بنجاح!'
	String get importSuccess => 'تم استيراد بيانات الاستكشاف بنجاح!';

	/// ar: 'فشل استيراد البيانات. تنسيق الملف غير صالح.'
	String get importFailed => 'فشل استيراد البيانات. تنسيق الملف غير صالح.';

	/// ar: 'لم يتم اختيار ملف'
	String get noFileSelected => 'لم يتم اختيار ملف';

	/// ar: 'خطأ في الاستيراد'
	String get importErrorPrefix => 'خطأ في الاستيراد';

	/// ar: 'تصدير'
	String get export => 'تصدير';

	/// ar: 'جارٍ التصدير...'
	String get exporting => 'جارٍ التصدير...';

	/// ar: 'تم التصدير بنجاح'
	String get exportSuccessTitle => 'تم التصدير بنجاح';

	/// ar: 'تم تصدير بيانات الاستكشاف إلى:'
	String get exportSuccessTo => 'تم تصدير بيانات الاستكشاف إلى:';

	/// ar: 'حسنًا'
	String get ok => 'حسنًا';

	/// ar: 'مشاركة'
	String get share => 'مشاركة';

	/// ar: 'فشل في تصدير البيانات'
	String get exportFailed => 'فشل في تصدير البيانات';

	/// ar: 'خطأ في التصدير'
	String get exportErrorPrefix => 'خطأ في التصدير';

	/// ar: 'تم العثور على ذاكرة تخزين مؤقت'
	String get cacheFoundTitle => 'تم العثور على ذاكرة تخزين مؤقت';

	/// ar: 'توجد بيانات استكشاف مخزنة مسبقًا. سيؤدي تحميل بيانات جديدة من واجهة البرمجة إلى استبدال البيانات الحالية. هل تريد المتابعة؟'
	String get cacheFoundMessage => 'توجد بيانات استكشاف مخزنة مسبقًا. سيؤدي تحميل بيانات جديدة من واجهة البرمجة إلى استبدال البيانات الحالية. هل تريد المتابعة؟';

	/// ar: 'تم تحميل بيانات الاستكشاف بنجاح!'
	String get loadDataSuccess => 'تم تحميل بيانات الاستكشاف بنجاح!';

	/// ar: 'فشل في تحميل البيانات'
	String get loadDataFailedPrefix => 'فشل في تحميل البيانات';

	/// ar: 'جارٍ التحميل...'
	String get loading => 'جارٍ التحميل...';

	/// ar: 'تحميل بيانات الاستكشاف'
	String get loadExploreData => 'تحميل بيانات الاستكشاف';
}

// Path: explore.episodes
class TranslationsExploreEpisodesAr {
	TranslationsExploreEpisodesAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الحلقات المتاحة'
	String get available => 'الحلقات المتاحة';

	/// ar: 'تشغيل السلسلة'
	String get playSeries => 'تشغيل السلسلة';

	/// ar: 'لا توجد مواسم متاحة'
	String get noSeasons => 'لا توجد مواسم متاحة';

	/// ar: 'انقر لتوسيع الحلقات'
	String get tapToExpand => 'انقر لتوسيع الحلقات';

	/// ar: 'المواسم'
	String get seasons => 'المواسم';

	/// ar: 'الموسم'
	String get seasonLabel => 'الموسم';

	/// ar: 'لم يتم العثور على حلقات'
	String get noEpisodesFound => 'لم يتم العثور على حلقات';

	/// ar: 'قد لا يكون الموسم {season} متاحًا'
	String get seasonMayNotBeAvailable => 'قد لا يكون الموسم {season} متاحًا';

	/// ar: 'مصفوفة الحلقات المجسمة'
	String get hologramMatrix => 'مصفوفة الحلقات المجسمة';

	/// ar: 'غير معروف'
	String get unknownFormat => 'غير معروف';

	/// ar: 'حلقة '
	String get epPrefix => 'حلقة ';
}

// Path: explore.info
class TranslationsExploreInfoAr {
	TranslationsExploreInfoAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'تيار بيانات غير معروف'
	String get unknownDataStream => 'تيار بيانات غير معروف';

	/// ar: 'التصنيف '
	String get ratedPrefix => 'التصنيف ';

	/// ar: 'الأنواع'
	String get genres => 'الأنواع';

	/// ar: 'الإصدار'
	String get release => 'الإصدار';

	/// ar: 'المزود'
	String get provider => 'المزود';

	/// ar: 'لا توجد بيانات مرئية'
	String get noVisualData => 'لا توجد بيانات مرئية';
}

// Path: diagnostics.networkStatus
class TranslationsDiagnosticsNetworkStatusAr {
	TranslationsDiagnosticsNetworkStatusAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'غير معروف'
	String get unknown => 'غير معروف';

	/// ar: 'غير متصل'
	String get notConnected => 'غير متصل';

	/// ar: 'غير متوفر'
	String get notAvailable => 'غير متوفر';

	/// ar: 'لم يتم الاختبار'
	String get notTested => 'لم يتم الاختبار';

	/// ar: 'جارٍ البدء...'
	String get starting => 'جارٍ البدء...';

	/// ar: 'جارٍ اختيار الخادم...'
	String get selectingServer => 'جارٍ اختيار الخادم...';

	/// ar: 'فشل'
	String get failed => 'فشل';

	/// ar: 'واي فاي'
	String get wifi => 'واي فاي';

	/// ar: 'بيانات الجوال'
	String get mobileData => 'بيانات الجوال';

	/// ar: 'إيثرنت'
	String get ethernet => 'إيثرنت';

	/// ar: 'غير متصل'
	String get offline => 'غير متصل';

	/// ar: 'شبكة الجوال'
	String get mobileNetwork => 'شبكة الجوال';

	/// ar: 'اتصال سلكي'
	String get wiredConnection => 'اتصال سلكي';

	/// ar: 'لا يوجد اتصال'
	String get noConnection => 'لا يوجد اتصال';

	/// ar: 'خطأ'
	String get error => 'خطأ';
}

// Path: diagnostics.logRecording
class TranslationsDiagnosticsLogRecordingAr {
	TranslationsDiagnosticsLogRecordingAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'تسجيل السجلات'
	String get title => 'تسجيل السجلات';

	/// ar: 'تمكين التسجيل التلقائي للسجلات لاستكشاف الأخطاء'
	String get subtitle => 'تمكين التسجيل التلقائي للسجلات لاستكشاف الأخطاء';

	/// ar: 'مفعّل'
	String get enabled => 'مفعّل';

	/// ar: 'معطّل'
	String get disabled => 'معطّل';
}

// Path: diagnostics.speedTest
class TranslationsDiagnosticsSpeedTestAr {
	TranslationsDiagnosticsSpeedTestAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'مكتمل'
	String get completed => 'مكتمل';

	/// ar: 'لم يتم الاختبار'
	String get notTested => 'لم يتم الاختبار';

	/// ar: 'افتراضي (flutter_speed_test_plus)'
	String get defaultServer => 'افتراضي (flutter_speed_test_plus)';
}

// Path: hiddenActions.explore
class TranslationsHiddenActionsExploreAr {
	TranslationsHiddenActionsExploreAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'استكشاف'
	String get title => 'استكشاف';

	/// ar: 'اكتشف المحتوى بمرشحات قوية'
	String get subtitle => 'اكتشف المحتوى بمرشحات قوية';
}

// Path: hiddenActions.diagnostics
class TranslationsHiddenActionsDiagnosticsAr {
	TranslationsHiddenActionsDiagnosticsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'التشخيص'
	String get title => 'التشخيص';

	/// ar: 'شارك السجلات ومعلومات الجهاز/الشبكة'
	String get subtitle => 'شارك السجلات ومعلومات الجهاز/الشبكة';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appTitle': return 'نموذج مشروع المنصة';
			case 'loginTitle': return 'تسجيل الدخول\nإلى حسابك';
			case 'loginSubtitle': return 'أدخل بريدك الإلكتروني الخاص بالعمل وكلمة المرور لتسجيل الدخول';
			case 'email': return 'البريد الإلكتروني';
			case 'enterEmail': return 'أدخل البريد الإلكتروني';
			case 'password': return 'كلمة المرور';
			case 'enterPassword': return 'أدخل كلمة المرور';
			case 'login': return 'تسجيل الدخول';
			case 'request_cancelled': return 'تم إلغاء الطلب';
			case 'connection_timeout': return 'انتهت مهلة الاتصال';
			case 'receive_timeout': return 'انتهت مهلة استلام البيانات';
			case 'send_timeout': return 'انتهت مهلة إرسال البيانات';
			case 'no_internet': return 'لا يوجد اتصال بالإنترنت';
			case 'response_data_not_found': return 'لم يتم العثور على بيانات الاستجابة';
			case 'unexpected_error': return 'حدث خطأ غير متوقع';
			case 'default_error_message': return 'حدث خطأ ما، يرجى المحاولة مرة أخرى';
			case 'bad_request': return 'طلب غير صالح';
			case 'unauthorized': return 'دخول غير مصرح به';
			case 'error_403_forbidden': return 'الدخول مرفوض';
			case 'error_404_not_found': return 'العنصر المطلوب غير موجود';
			case 'session_expired': return 'انتهت صلاحية الجلسة';
			case 'internal_server_error': return 'خطأ في الخادم الداخلي';
			case 'server_unavailable': return 'الخادم غير متوفر';
			case 'something_went_wrong': return 'حدث خطأ ما';
			case 'unknownError': return 'حدث خطأ غير معروف.';
			case 'connectionError': return 'خطأ في الاتصال. يرجى التحقق من الإنترنت.';
			case 'invalidCredentials': return 'بيانات الاعتماد غير صحيحة. يرجى المحاولة مرة أخرى.';
			case 'usedEmail': return 'هذا البريد الإلكتروني مستخدم بالفعل.';
			case 'needAuth': return 'الرجاء إعادة تسجيل الدخول';
			case 'proceed': return 'المواصلة';
			case 'loginExpired': return 'تم إنتهاء الجلسة.';
			case 'failedGoogleAuth': return 'فشل تسجيل الدخول باستخدام Google.';
			case 'retry': return 'إعادة المحاولة';
			case 'homePage.matches.title': return 'المباريات';
			case 'homePage.matches.empty': return 'لا يوجد مباريات اليوم';
			case 'homePage.matches.live': return 'مباشر';
			case 'homePage.matches.upcoming': return 'قادم';
			case 'seasons': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
				zero: 'موسم',
				one: 'موسم',
				two: 'موسمين',
				few: 'مواسم',
				many: 'موسم',
				other: 'موسم',
			);
			case 'profile.accountSettings': return 'إعدادات الحساب';
			case 'profile.subscription': return 'الاشتراك';
			case 'profile.vouchers': return 'القسائم';
			case 'profile.language': return 'اللغة';
			case 'profile.privacyPolicy': return 'سياسة الخصوصية';
			case 'profile.hiddenActions': return 'خيارات ضامن الجودة';
			case 'profile.chooseLanguage': return 'اختر اللغة';
			case 'profile.arabic': return 'عربي';
			case 'profile.english': return 'English';
			case 'loggingOut': return 'تسجيل الخروج؟';
			case 'logoutConfirmation': return 'هل أنت متأكد أنك تريد تسجيل الخروج من المنصة؟';
			case 'logout': return 'تسجيل الخروج';
			case 'cancel': return 'إلغاء';
			case 'auth.mainDescription': return 'اكتشف المنصة—بوابتك\nإلى الترفيه المتميز!';
			case 'auth.subDescription': return 'أفلام • مسلسلات • مباريات';
			case 'auth.releaseDate': return 'قادم في 8 مارس';
			case 'auth.signUp': return 'إنشاء حساب';
			case 'auth.alreadyHaveAccount': return 'لديك حساب بالفعل؟ ';
			case 'auth.authenticationFailed': return 'فشل في المصادقة يرجى المحاولة مرة أخرى';
			case 'navigation.home': return 'الرئيسية';
			case 'navigation.explore': return 'استكشاف';
			case 'navigation.search': return 'البحث';
			case 'navigation.profile': return 'الملف الشخصي';
			case 'searchPage.search': return 'بحث';
			case 'searchPage.noResultsFound': return 'لم يتم العثور على نتائج';
			case 'searchPage.resultsFound': return 'نتائج تم العثور عليها';
			case 'searchPage.topResults': return 'أفضل النتائج';
			case 'searchPage.movies': return 'أفلام';
			case 'searchPage.tvShows': return 'مسلسلات';
			case 'searchPage.tvChannels': return 'القنوات\nالتلفزيونية';
			case 'searchPage.matches': return 'المباريات';
			case 'searchPage.catchup': return 'رياضة';
			case 'searchPage.browse': return 'تصفح';
			case 'searchPage.searchFailed': return 'فشل البحث. يرجى المحاولة مرة أخرى.';
			case 'searchPage.unknown': return 'غير معروف';
			case 'contentTypes.movie': return 'أفلام';
			case 'contentTypes.series': return 'مسلسلات';
			case 'contentTypes.catchup': return 'رياضة';
			case 'contentTypes.sport': return 'رياضة';
			case 'contentTypes.documentary': return 'وثائقي';
			case 'contentTypes.tvShow': return 'برامج تلفزيونية';
			case 'contentTypes.other': return 'أخرى';
			case 'homeSlider.signUpToWatch': return 'اشترك للمشاهدة';
			case 'homeSlider.watchNow': return 'شاهد الآن';
			case 'homeTabs.home': return 'الرئيسية';
			case 'homeTabs.movies': return 'الأفلام';
			case 'homeTabs.matches': return 'المباريات';
			case 'homeTabs.music': return 'الموسيقى';
			case 'homeTabs.tvChannels': return 'القنوات التلفزيونية';
			case 'sections.categories': return 'الفئات';
			case 'sections.popularChannels': return 'القنوات الشائعة';
			case 'episodes.episodePrefix': return 'حلقة';
			case 'episodes.episodeNumber': return 'الحلقة {number}';
			case 'episodes.episodes': return 'الحلقات';
			case 'episodes.demo': return '* تجريبي';
			case 'live': return 'مباشر';
			case 'splash.unknownErrorMessage': return 'حدث خطأ غير معروف، يرجى تحديث التطبيق أو الانتظار حتى يتم إصلاحه';
			case 'splash.retryNow': return 'إعادة المحاولة الآن';
			case 'splash.errorPrefix': return 'الخطأ: ';
			case 'explore.title': return 'مستكشف عصبي';
			case 'explore.loadingStreams': return '...جارٍ تحميل تدفقات البيانات';
			case 'explore.connectionError': return 'خطأ في الاتصال';
			case 'explore.failedToLoadStreams': return 'فشل في تحميل تدفقات البيانات';
			case 'explore.noStreamsFound': return 'لم يتم العثور على تدفقات بيانات';
			case 'explore.adjustFilters': return 'عدّل المرشحات لاكتشاف المحتوى';
			case 'explore.navigationError': return 'خطأ في التنقل';
			case 'explore.contentUnavailable': return 'بيانات المحتوى غير متوفرة';
			case 'explore.episodeUnavailable': return 'بيانات الحلقة غير متوفرة';
			case 'explore.unknown': return 'غير معروف';
			case 'explore.unknownEpisode': return 'حلقة غير معروفة';
			case 'explore.summary.showingAllPrefix': return 'عرض الكل';
			case 'explore.summary.streams': return 'تدفقات';
			case 'explore.summary.filteredPrefix': return 'تم التصفية:';
			case 'explore.summary.localFilters': return 'مرشحات محلية';
			case 'explore.summary.loadingLocalFilters': return '...تطبيق المرشحات العصبية المحلية';
			case 'explore.summary.filterErrorDetected': return 'تم اكتشاف خطأ في التصفية';
			case 'explore.summary.mixed': return 'مختلط';
			case 'explore.summary.movie': return 'فيلم';
			case 'explore.summary.series': return 'مسلسل';
			case 'explore.summary.recording': return 'تسجيل';
			case 'explore.summary.channel': return 'قناة';
			case 'explore.filters.header': return 'المرشحات العصبية';
			case 'explore.filters.contentType': return 'نوع المحتوى';
			case 'explore.filters.providers': return 'المزودون';
			case 'explore.filters.streamFormat': return 'صيغة البث';
			case 'explore.filters.contentFeatures': return 'خصائص المحتوى';
			case 'explore.filters.active': return 'مفعّل';
			case 'explore.filters.reset': return 'إعادة تعيين';
			case 'explore.filters.movies': return 'أفلام';
			case 'explore.filters.series': return 'مسلسلات';
			case 'explore.filters.recordings': return 'تسجيلات';
			case 'explore.filters.channels': return 'قنوات';
			case 'explore.filters.premium': return 'متميز';
			case 'explore.filters.multipleMp4': return 'ملفات MP4 متعددة';
			case 'explore.filters.nonAdaptiveWithSubtitles': return 'غير تكيفي مع ترجمة';
			case 'explore.filters.oneStreamOnly': return 'بث واحد فقط';
			case 'explore.filters.resetAllData': return 'إعادة تعيين كل البيانات';
			case 'explore.filters.resetConfirmWithCache': return 'سيتم حذف جميع بيانات الاستكشاف المخزنة والإعدادات نهائيًا. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟';
			case 'explore.filters.resetConfirmNoCache': return 'لا توجد بيانات مخزنة. ستتم إعادة تعيين أي مرشحات وإعدادات متبقية. هذا الإجراء لا يمكن التراجع عنه. هل تريد المتابعة؟';
			case 'explore.filters.resetAll': return 'إعادة تعيين الكل';
			case 'explore.filters.resetSuccess': return 'تمت إعادة تعيين بيانات الاستكشاف والمرشحات!';
			case 'explore.filters.resetOfflineData': return 'إعادة تعيين البيانات دون اتصال';
			case 'explore.filters.resetting': return 'جارٍ الإعادة...';
			case 'explore.filters.import': return 'استيراد';
			case 'explore.filters.importing': return 'جارٍ الاستيراد...';
			case 'explore.filters.importSuccess': return 'تم استيراد بيانات الاستكشاف بنجاح!';
			case 'explore.filters.importFailed': return 'فشل استيراد البيانات. تنسيق الملف غير صالح.';
			case 'explore.filters.noFileSelected': return 'لم يتم اختيار ملف';
			case 'explore.filters.importErrorPrefix': return 'خطأ في الاستيراد';
			case 'explore.filters.export': return 'تصدير';
			case 'explore.filters.exporting': return 'جارٍ التصدير...';
			case 'explore.filters.exportSuccessTitle': return 'تم التصدير بنجاح';
			case 'explore.filters.exportSuccessTo': return 'تم تصدير بيانات الاستكشاف إلى:';
			case 'explore.filters.ok': return 'حسنًا';
			case 'explore.filters.share': return 'مشاركة';
			case 'explore.filters.exportFailed': return 'فشل في تصدير البيانات';
			case 'explore.filters.exportErrorPrefix': return 'خطأ في التصدير';
			case 'explore.filters.cacheFoundTitle': return 'تم العثور على ذاكرة تخزين مؤقت';
			case 'explore.filters.cacheFoundMessage': return 'توجد بيانات استكشاف مخزنة مسبقًا. سيؤدي تحميل بيانات جديدة من واجهة البرمجة إلى استبدال البيانات الحالية. هل تريد المتابعة؟';
			case 'explore.filters.loadDataSuccess': return 'تم تحميل بيانات الاستكشاف بنجاح!';
			case 'explore.filters.loadDataFailedPrefix': return 'فشل في تحميل البيانات';
			case 'explore.filters.loading': return 'جارٍ التحميل...';
			case 'explore.filters.loadExploreData': return 'تحميل بيانات الاستكشاف';
			case 'explore.episodes.available': return 'الحلقات المتاحة';
			case 'explore.episodes.playSeries': return 'تشغيل السلسلة';
			case 'explore.episodes.noSeasons': return 'لا توجد مواسم متاحة';
			case 'explore.episodes.tapToExpand': return 'انقر لتوسيع الحلقات';
			case 'explore.episodes.seasons': return 'المواسم';
			case 'explore.episodes.seasonLabel': return 'الموسم';
			case 'explore.episodes.noEpisodesFound': return 'لم يتم العثور على حلقات';
			case 'explore.episodes.seasonMayNotBeAvailable': return 'قد لا يكون الموسم {season} متاحًا';
			case 'explore.episodes.hologramMatrix': return 'مصفوفة الحلقات المجسمة';
			case 'explore.episodes.unknownFormat': return 'غير معروف';
			case 'explore.episodes.epPrefix': return 'حلقة ';
			case 'explore.info.unknownDataStream': return 'تيار بيانات غير معروف';
			case 'explore.info.ratedPrefix': return 'التصنيف ';
			case 'explore.info.genres': return 'الأنواع';
			case 'explore.info.release': return 'الإصدار';
			case 'explore.info.provider': return 'المزود';
			case 'explore.info.noVisualData': return 'لا توجد بيانات مرئية';
			case 'diagnostics.title': return 'التشخيص';
			case 'diagnostics.shareLogs': return 'مشاركة السجلات';
			case 'diagnostics.resetLogs': return 'إعادة تعيين السجلات';
			case 'diagnostics.preparingDiagnostics': return 'جارٍ إعداد التشخيص...';
			case 'diagnostics.errorLoadingDiagnostics': return 'خطأ في تحميل التشخيص';
			case 'diagnostics.retry': return 'إعادة المحاولة';
			case 'diagnostics.shareLogsAndDeviceInfo': return 'شارك السجلات ومعلومات الجهاز مع المطور';
			case 'diagnostics.preparing': return 'جارٍ الإعداد...';
			case 'diagnostics.shareDiagnostics': return 'مشاركة التشخيص';
			case 'diagnostics.clearLogs': return 'مسح السجلات';
			case 'diagnostics.preparingLogs': return 'جارٍ إعداد السجلات...';
			case 'diagnostics.internetSpeed': return 'سرعة الإنترنت';
			case 'diagnostics.download': return 'التحميل';
			case 'diagnostics.upload': return 'الرفع';
			case 'diagnostics.testing': return 'جارٍ الاختبار...';
			case 'diagnostics.testSpeed': return 'اختبار السرعة';
			case 'diagnostics.storageDetails': return 'تفاصيل التخزين';
			case 'diagnostics.logFileSize': return 'حجم ملف السجل';
			case 'diagnostics.clearLogsNote': return 'امسح السجلات عندما لا تكون مطلوبة لتوفير مساحة التخزين';
			case 'diagnostics.totalRecorded': return 'إجمالي المسجل';
			case 'diagnostics.storageCapacity': return 'سعة التخزين';
			case 'diagnostics.activeFile': return 'الملف النشط';
			case 'diagnostics.updated': return 'تم التحديث';
			case 'diagnostics.resetLogsTitle': return 'إعادة تعيين السجلات';
			case 'diagnostics.resetLogsMessage': return 'سيؤدي هذا إلى حذف جميع ملفات السجلات والبدء من جديد. هل تريد المتابعة؟';
			case 'diagnostics.cancel': return 'إلغاء';
			case 'diagnostics.reset': return 'إعادة تعيين';
			case 'diagnostics.shareLogsSubject': return 'سجلات التشخيص';
			case 'diagnostics.networkStatus.unknown': return 'غير معروف';
			case 'diagnostics.networkStatus.notConnected': return 'غير متصل';
			case 'diagnostics.networkStatus.notAvailable': return 'غير متوفر';
			case 'diagnostics.networkStatus.notTested': return 'لم يتم الاختبار';
			case 'diagnostics.networkStatus.starting': return 'جارٍ البدء...';
			case 'diagnostics.networkStatus.selectingServer': return 'جارٍ اختيار الخادم...';
			case 'diagnostics.networkStatus.failed': return 'فشل';
			case 'diagnostics.networkStatus.wifi': return 'واي فاي';
			case 'diagnostics.networkStatus.mobileData': return 'بيانات الجوال';
			case 'diagnostics.networkStatus.ethernet': return 'إيثرنت';
			case 'diagnostics.networkStatus.offline': return 'غير متصل';
			case 'diagnostics.networkStatus.mobileNetwork': return 'شبكة الجوال';
			case 'diagnostics.networkStatus.wiredConnection': return 'اتصال سلكي';
			case 'diagnostics.networkStatus.noConnection': return 'لا يوجد اتصال';
			case 'diagnostics.networkStatus.error': return 'خطأ';
			case 'diagnostics.logRecording.title': return 'تسجيل السجلات';
			case 'diagnostics.logRecording.subtitle': return 'تمكين التسجيل التلقائي للسجلات لاستكشاف الأخطاء';
			case 'diagnostics.logRecording.enabled': return 'مفعّل';
			case 'diagnostics.logRecording.disabled': return 'معطّل';
			case 'diagnostics.speedTest.completed': return 'مكتمل';
			case 'diagnostics.speedTest.notTested': return 'لم يتم الاختبار';
			case 'diagnostics.speedTest.defaultServer': return 'افتراضي (flutter_speed_test_plus)';
			case 'hiddenActions.title': return 'الإجراءات المخفية';
			case 'hiddenActions.subtitle': return 'إلى أين تريد الذهاب؟';
			case 'hiddenActions.explore.title': return 'استكشاف';
			case 'hiddenActions.explore.subtitle': return 'اكتشف المحتوى بمرشحات قوية';
			case 'hiddenActions.diagnostics.title': return 'التشخيص';
			case 'hiddenActions.diagnostics.subtitle': return 'شارك السجلات ومعلومات الجهاز/الشبكة';
			case 'errorMessage.noNextEpisode': return 'لا يوجد حلقة تالية للمشاهدة';
			case 'subscription.title': return 'الاشتراك';
			case 'subscription.chooseYourSubscription': return 'اختر اشتراكك';
			case 'subscription.chooseYourPlan': return 'اختر خطتك واستمتع بالمسلسلات والأفلام والقنوات المباشرة.';
			case 'subscription.plusSubscription': return 'اشتراك بلس';
			case 'subscription.voucher': return 'قسيمة';
			case 'subscription.voucherDescription': return 'هل لديك قسيمة؟ أدخل رمز القسيمة لتفعيل خطتك';
			case 'subscription.continueButton': return 'متابعة';
			case 'subscription.yourSubscription': return 'اشتراكك';
			case 'subscription.manageSubscription': return 'إدارة الاشتراك';
			case 'subscription.openingSubscriptionManagement': return 'فتح إدارة الاشتراك...';
			case 'subscription.active': return 'نشط';
			case 'subscription.expiresOn': return ({required InlineSpan date}) => TextSpan(children: [
				const TextSpan(text: 'ينتهي في: '),
				date,
			]);
			case 'subscription.redeemYourVoucher': return 'استرد قسيمتك';
			case 'subscription.enterVoucherCode': return 'أدخل رمز القسيمة المكون من 16 رقمًا';
			case 'subscription.whereCanIGetVoucher': return 'من أين يمكنني الحصول على قسيمة؟';
			case 'subscription.buyVouchersFromResellers': return 'اشتر القسائم من موزعينا الموثوقين';
			case 'subscription.watchHowToActivate': return 'شاهد كيفية تفعيل قسيمتك';
			case 'subscription.unlimitedAccess': return 'وصول غير محدود للأفلام والمسلسلات والرياضة المباشرة بدون إعلانات.';
			case 'subscription.perMonth': return '/شهريًا';
			case 'subscription.voucherSubscription': return 'اشتراك قسيمة';
			default: return null;
		}
	}
}

