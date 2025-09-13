///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => 'AL-Manasa PoC';
	@override String get loginTitle => 'Login to your\nAccount';
	@override String get loginSubtitle => 'Enter your work email and password to log in';
	@override String get email => 'Email';
	@override String get enterEmail => 'Enter Email';
	@override String get password => 'Password';
	@override String get enterPassword => 'Enter Password';
	@override String get login => 'Login';
	@override String get request_cancelled => 'Request was cancelled';
	@override String get connection_timeout => 'Connection timed out';
	@override String get receive_timeout => 'Receiving data timed out';
	@override String get send_timeout => 'Sending data timed out';
	@override String get no_internet => 'No internet connection';
	@override String get response_data_not_found => 'Response data not found';
	@override String get unexpected_error => 'An unexpected error occurred';
	@override String get default_error_message => 'Something went wrong, please try again';
	@override String get bad_request => 'Bad request';
	@override String get unauthorized => 'Unauthorized access';
	@override String get error_403_forbidden => 'Access is forbidden';
	@override String get error_404_not_found => 'Requested resource not found';
	@override String get session_expired => 'Session has expired';
	@override String get internal_server_error => 'Internal server error';
	@override String get server_unavailable => 'Server is unavailable';
	@override String get something_went_wrong => 'Something went wrong';
	@override String get unknownError => 'An unknown error occurred.';
	@override String get connectionError => 'Connection error. Please check your internet.';
	@override String get invalidCredentials => 'Invalid credentials. Please try again.';
	@override String get usedEmail => 'This email is already in use.';
	@override String get needAuth => 'Please Login In Again.';
	@override String get loginExpired => 'Login session has expired.';
	@override String get proceed => 'Continue';
	@override String get failedGoogleAuth => 'Google authentication failed.';
	@override String get retry => 'Retry';
	@override late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
	@override String seasons({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Season',
		other: 'Seasons',
	);
	@override late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
	@override String get loggingOut => 'Logging out?';
	@override String get logoutConfirmation => 'Are you sure you want to logout from Almanasa?';
	@override String get logout => 'Logout';
	@override String get cancel => 'Cancel';
	@override late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	@override late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(_root);
	@override late final _TranslationsSearchPageEn searchPage = _TranslationsSearchPageEn._(_root);
	@override late final _TranslationsContentTypesEn contentTypes = _TranslationsContentTypesEn._(_root);
	@override late final _TranslationsHomeSliderEn homeSlider = _TranslationsHomeSliderEn._(_root);
	@override late final _TranslationsHomeTabsEn homeTabs = _TranslationsHomeTabsEn._(_root);
	@override late final _TranslationsSectionsEn sections = _TranslationsSectionsEn._(_root);
	@override late final _TranslationsEpisodesEn episodes = _TranslationsEpisodesEn._(_root);
	@override String get live => 'LIVE';
	@override late final _TranslationsSplashEn splash = _TranslationsSplashEn._(_root);
	@override late final _TranslationsExploreEn explore = _TranslationsExploreEn._(_root);
	@override late final _TranslationsErrorMessageEn errorMessage = _TranslationsErrorMessageEn._(_root);
	@override late final _TranslationsDiagnosticsEn diagnostics = _TranslationsDiagnosticsEn._(_root);
	@override late final _TranslationsHiddenActionsEn hiddenActions = _TranslationsHiddenActionsEn._(_root);
	@override late final _TranslationsSubscriptionEn subscription = _TranslationsSubscriptionEn._(_root);
}

// Path: homePage
class _TranslationsHomePageEn implements TranslationsHomePageAr {
	_TranslationsHomePageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomePageMatchesEn matches = _TranslationsHomePageMatchesEn._(_root);
}

// Path: profile
class _TranslationsProfileEn implements TranslationsProfileAr {
	_TranslationsProfileEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get accountSettings => 'Account Settings';
	@override String get subscription => 'Subscription';
	@override String get vouchers => 'Vouchers';
	@override String get language => 'Language';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get hiddenActions => 'QA Options';
	@override String get chooseLanguage => 'Choose the language';
	@override String get arabic => 'عربي';
	@override String get english => 'English';
}

// Path: auth
class _TranslationsAuthEn implements TranslationsAuthAr {
	_TranslationsAuthEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mainDescription => 'Discover Almanasa—your gateway\nto premium entertainment!';
	@override String get subDescription => 'Movies • TV Shows • Matches';
	@override String get releaseDate => 'Coming on March 8';
	@override String get signUp => 'Sign Up';
	@override String get alreadyHaveAccount => 'Already have an account? ';
	@override String get authenticationFailed => 'Authentication failed please try again';
}

// Path: navigation
class _TranslationsNavigationEn implements TranslationsNavigationAr {
	_TranslationsNavigationEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get explore => 'Explore';
	@override String get search => 'Search';
	@override String get profile => 'Profile';
}

// Path: searchPage
class _TranslationsSearchPageEn implements TranslationsSearchPageAr {
	_TranslationsSearchPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get search => 'Search';
	@override String get noResultsFound => 'No results found';
	@override String get resultsFound => 'results found';
	@override String get topResults => 'Top Results';
	@override String get movies => 'Movies';
	@override String get tvShows => 'TV\nShows';
	@override String get tvChannels => 'TV\nChannels';
	@override String get matches => 'Matches';
	@override String get catchup => 'Sports';
	@override String get browse => 'Browse';
	@override String get searchFailed => 'Failed to search. Please try again.';
	@override String get unknown => 'Unknown';
}

// Path: contentTypes
class _TranslationsContentTypesEn implements TranslationsContentTypesAr {
	_TranslationsContentTypesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get movie => 'Movies';
	@override String get series => 'Series';
	@override String get catchup => 'Sports';
	@override String get sport => 'Sports';
	@override String get documentary => 'Documentary';
	@override String get tvShow => 'TV Shows';
	@override String get other => 'Other';
}

// Path: homeSlider
class _TranslationsHomeSliderEn implements TranslationsHomeSliderAr {
	_TranslationsHomeSliderEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get signUpToWatch => 'Sign up to watch';
	@override String get watchNow => 'Watch Now';
}

// Path: homeTabs
class _TranslationsHomeTabsEn implements TranslationsHomeTabsAr {
	_TranslationsHomeTabsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get movies => 'Movies';
	@override String get matches => 'Matches';
	@override String get music => 'Music';
	@override String get tvChannels => 'TV Channels';
}

// Path: sections
class _TranslationsSectionsEn implements TranslationsSectionsAr {
	_TranslationsSectionsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get categories => 'Categories';
	@override String get popularChannels => 'Popular Channels';
}

// Path: episodes
class _TranslationsEpisodesEn implements TranslationsEpisodesAr {
	_TranslationsEpisodesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get episodePrefix => 'Episode';
	@override String get episodeNumber => 'Episode {number}';
	@override String get episodes => 'Episodes';
	@override String get demo => '* demo';
}

// Path: splash
class _TranslationsSplashEn implements TranslationsSplashAr {
	_TranslationsSplashEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknownErrorMessage => 'Unknown error happened, please update the app or wait until it is fixed';
	@override String get retryNow => 'Retry Now';
	@override String get errorPrefix => 'Error: ';
}

// Path: explore
class _TranslationsExploreEn implements TranslationsExploreAr {
	_TranslationsExploreEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'NEURAL EXPLORER';
	@override String get loadingStreams => 'LOADING DATA STREAMS...';
	@override String get connectionError => 'CONNECTION ERROR';
	@override String get failedToLoadStreams => 'Failed to load data streams';
	@override String get noStreamsFound => 'NO DATA STREAMS FOUND';
	@override String get adjustFilters => 'Adjust neural filters to discover content';
	@override String get navigationError => 'NAVIGATION ERROR';
	@override String get contentUnavailable => 'CONTENT DATA UNAVAILABLE';
	@override String get episodeUnavailable => 'EPISODE DATA UNAVAILABLE';
	@override String get unknown => 'Unknown';
	@override String get unknownEpisode => 'Unknown Episode';
	@override late final _TranslationsExploreSummaryEn summary = _TranslationsExploreSummaryEn._(_root);
	@override late final _TranslationsExploreFiltersEn filters = _TranslationsExploreFiltersEn._(_root);
	@override late final _TranslationsExploreEpisodesEn episodes = _TranslationsExploreEpisodesEn._(_root);
	@override late final _TranslationsExploreInfoEn info = _TranslationsExploreInfoEn._(_root);
}

// Path: errorMessage
class _TranslationsErrorMessageEn implements TranslationsErrorMessageAr {
	_TranslationsErrorMessageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get noNextEpisode => 'لا يوجد حلقة تالية للمشاهدة';
}

// Path: diagnostics
class _TranslationsDiagnosticsEn implements TranslationsDiagnosticsAr {
	_TranslationsDiagnosticsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diagnostics';
	@override String get shareLogs => 'Share Logs';
	@override String get resetLogs => 'Reset Logs';
	@override String get preparingDiagnostics => 'Preparing diagnostics...';
	@override String get errorLoadingDiagnostics => 'Error loading diagnostics';
	@override String get retry => 'Retry';
	@override String get shareLogsAndDeviceInfo => 'Share logs and device info with the developer';
	@override String get preparing => 'Preparing...';
	@override String get shareDiagnostics => 'Share Diagnostics';
	@override String get clearLogs => 'Clear Logs';
	@override String get preparingLogs => 'Preparing logs...';
	@override String get internetSpeed => 'Internet Speed';
	@override String get download => 'Download';
	@override String get upload => 'Upload';
	@override String get testing => 'Testing...';
	@override String get testSpeed => 'Test Speed';
	@override String get storageDetails => 'Storage Details';
	@override String get logFileSize => 'Log File Size';
	@override String get clearLogsNote => 'Clear logs when not needed to save storage space';
	@override String get totalRecorded => 'Total recorded';
	@override String get storageCapacity => 'Storage capacity';
	@override String get activeFile => 'Active file';
	@override String get updated => 'Updated';
	@override String get resetLogsTitle => 'Reset Logs';
	@override String get resetLogsMessage => 'This will delete all log files and start fresh. Continue?';
	@override String get cancel => 'Cancel';
	@override String get reset => 'Reset';
	@override String get shareLogsSubject => 'Diagnostics logs';
	@override late final _TranslationsDiagnosticsNetworkStatusEn networkStatus = _TranslationsDiagnosticsNetworkStatusEn._(_root);
	@override late final _TranslationsDiagnosticsLogRecordingEn logRecording = _TranslationsDiagnosticsLogRecordingEn._(_root);
	@override late final _TranslationsDiagnosticsSpeedTestEn speedTest = _TranslationsDiagnosticsSpeedTestEn._(_root);
}

// Path: hiddenActions
class _TranslationsHiddenActionsEn implements TranslationsHiddenActionsAr {
	_TranslationsHiddenActionsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hidden Actions';
	@override String get subtitle => 'Where would you like to go?';
	@override late final _TranslationsHiddenActionsExploreEn explore = _TranslationsHiddenActionsExploreEn._(_root);
	@override late final _TranslationsHiddenActionsDiagnosticsEn diagnostics = _TranslationsHiddenActionsDiagnosticsEn._(_root);
}

// Path: subscription
class _TranslationsSubscriptionEn implements TranslationsSubscriptionAr {
	_TranslationsSubscriptionEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subscription';
	@override String get chooseYourSubscription => 'Choose Your Subscription';
	@override String get chooseYourPlan => 'Choose your plan and enjoy series, movies, and live channels.';
	@override String get plusSubscription => 'Plus Subscription';
	@override String get voucher => 'Voucher';
	@override String get voucherDescription => 'Do you have a voucher? Enter the voucher code to activate your plan';
	@override String get continueButton => 'Continue';
	@override String get yourSubscription => 'Your Subscription';
	@override String get manageSubscription => 'Manage Subscription';
	@override String get openingSubscriptionManagement => 'Opening subscription management...';
	@override String get active => 'Active';
	@override TextSpan expiresOn({required InlineSpan date}) => TextSpan(children: [
		const TextSpan(text: 'Expires on: '),
		date,
	]);
	@override String get redeemYourVoucher => 'Redeem Your Voucher';
	@override String get enterVoucherCode => 'Enter your 16 digits voucher code';
	@override String get whereCanIGetVoucher => 'Where can I get a voucher?';
	@override String get buyVouchersFromResellers => 'Buy vouchers from our trusted resellers';
	@override String get watchHowToActivate => 'Watch how to activate your voucher';
	@override String get unlimitedAccess => 'Unlimited access to movies, shows, and live sports with no ads.';
	@override String get perMonth => '/Per Month';
	@override String get voucherSubscription => 'Voucher Subscription';
}

// Path: homePage.matches
class _TranslationsHomePageMatchesEn implements TranslationsHomePageMatchesAr {
	_TranslationsHomePageMatchesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Matches';
	@override String get empty => 'No matches scheduled for today.';
	@override String get live => 'Live';
	@override String get upcoming => 'Upcoming';
}

// Path: explore.summary
class _TranslationsExploreSummaryEn implements TranslationsExploreSummaryAr {
	_TranslationsExploreSummaryEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get showingAllPrefix => 'SHOWING ALL';
	@override String get filteredPrefix => 'FILTERED:';
	@override String get streams => 'STREAMS';
	@override String get localFilters => 'LOCAL FILTERS';
	@override String get loadingLocalFilters => 'APPLYING LOCAL NEURAL FILTERS...';
	@override String get filterErrorDetected => 'FILTER ERROR DETECTED';
	@override String get mixed => 'MIXED';
	@override String get movie => 'MOVIE';
	@override String get series => 'SERIES';
	@override String get recording => 'RECORDING';
	@override String get channel => 'CHANNEL';
}

// Path: explore.filters
class _TranslationsExploreFiltersEn implements TranslationsExploreFiltersAr {
	_TranslationsExploreFiltersEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get header => 'NEURAL FILTERS';
	@override String get contentType => 'CONTENT TYPE';
	@override String get providers => 'PROVIDERS';
	@override String get streamFormat => 'STREAM FORMAT';
	@override String get contentFeatures => 'CONTENT FEATURES';
	@override String get active => 'ACTIVE';
	@override String get reset => 'RESET';
	@override String get movies => 'MOVIES';
	@override String get series => 'SERIES';
	@override String get recordings => 'RECORDINGS';
	@override String get channels => 'CHANNELS';
	@override String get premium => 'PREMIUM';
	@override String get multipleMp4 => 'MULTIPLE MP4 FILES';
	@override String get nonAdaptiveWithSubtitles => 'NON-ADAPTIVE WITH SUBTITLES';
	@override String get oneStreamOnly => 'ONE STREAM ONLY';
	@override String get resetAllData => 'Reset All Data';
	@override String get resetConfirmWithCache => 'This will permanently delete all cached explore data, filters, and settings. This action cannot be undone. Are you sure you want to proceed?';
	@override String get resetConfirmNoCache => 'No cached data found. Reset will clear any remaining filters and settings. This action cannot be undone. Are you sure you want to proceed?';
	@override String get resetAll => 'Reset All';
	@override String get resetSuccess => 'Explore data and filters have been reset!';
	@override String get resetOfflineData => 'RESET OFFLINE DATA';
	@override String get resetting => 'Resetting...';
	@override String get import => 'IMPORT';
	@override String get importing => 'Importing...';
	@override String get importSuccess => 'Explore data imported successfully!';
	@override String get importFailed => 'Failed to import data. Invalid file format.';
	@override String get noFileSelected => 'No file selected';
	@override String get importErrorPrefix => 'Import error';
	@override String get export => 'EXPORT';
	@override String get exporting => 'Exporting...';
	@override String get exportSuccessTitle => 'Export Successful';
	@override String get exportSuccessTo => 'Explore data exported to:';
	@override String get ok => 'OK';
	@override String get share => 'Share';
	@override String get exportFailed => 'Failed to export data';
	@override String get exportErrorPrefix => 'Export error';
	@override String get cacheFoundTitle => 'Cache Found';
	@override String get cacheFoundMessage => 'There is already cached explore data available. Loading fresh data from the API will replace the existing cache. Do you want to proceed?';
	@override String get loadDataSuccess => 'Explore data loaded successfully!';
	@override String get loadDataFailedPrefix => 'Failed to load data';
	@override String get loading => 'Loading...';
	@override String get loadExploreData => 'LOAD EXPLORE DATA';
}

// Path: explore.episodes
class _TranslationsExploreEpisodesEn implements TranslationsExploreEpisodesAr {
	_TranslationsExploreEpisodesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get available => 'EPISODES AVAILABLE';
	@override String get playSeries => 'PLAY SERIES';
	@override String get noSeasons => 'No seasons available';
	@override String get tapToExpand => 'TAP TO EXPAND EPISODES';
	@override String get seasons => 'SEASONS';
	@override String get seasonLabel => 'SEASON';
	@override String get noEpisodesFound => 'NO EPISODES FOUND';
	@override String get seasonMayNotBeAvailable => 'Season {season} may not be available';
	@override String get hologramMatrix => 'HOLOGRAM EPISODE MATRIX';
	@override String get unknownFormat => 'UNK';
	@override String get epPrefix => 'EP ';
}

// Path: explore.info
class _TranslationsExploreInfoEn implements TranslationsExploreInfoAr {
	_TranslationsExploreInfoEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknownDataStream => 'UNKNOWN DATA STREAM';
	@override String get ratedPrefix => 'RATED ';
	@override String get genres => 'GENRES';
	@override String get release => 'RELEASE';
	@override String get provider => 'PROVIDER';
	@override String get noVisualData => 'NO VISUAL DATA';
}

// Path: diagnostics.networkStatus
class _TranslationsDiagnosticsNetworkStatusEn implements TranslationsDiagnosticsNetworkStatusAr {
	_TranslationsDiagnosticsNetworkStatusEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'Unknown';
	@override String get notConnected => 'Not connected';
	@override String get notAvailable => 'Not available';
	@override String get notTested => 'Not tested';
	@override String get starting => 'Starting...';
	@override String get selectingServer => 'Selecting server...';
	@override String get failed => 'Failed';
	@override String get wifi => 'Wi-Fi';
	@override String get mobileData => 'Mobile Data';
	@override String get ethernet => 'Ethernet';
	@override String get offline => 'Offline';
	@override String get mobileNetwork => 'Mobile network';
	@override String get wiredConnection => 'Wired connection';
	@override String get noConnection => 'No connection';
	@override String get error => 'Error';
}

// Path: diagnostics.logRecording
class _TranslationsDiagnosticsLogRecordingEn implements TranslationsDiagnosticsLogRecordingAr {
	_TranslationsDiagnosticsLogRecordingEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log Recording';
	@override String get subtitle => 'Enable automatic log recording for troubleshooting';
	@override String get enabled => 'Enabled';
	@override String get disabled => 'Disabled';
}

// Path: diagnostics.speedTest
class _TranslationsDiagnosticsSpeedTestEn implements TranslationsDiagnosticsSpeedTestAr {
	_TranslationsDiagnosticsSpeedTestEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get completed => 'Completed';
	@override String get notTested => 'Not tested';
	@override String get defaultServer => 'Default (flutter_speed_test_plus)';
}

// Path: hiddenActions.explore
class _TranslationsHiddenActionsExploreEn implements TranslationsHiddenActionsExploreAr {
	_TranslationsHiddenActionsExploreEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Explore';
	@override String get subtitle => 'Discover content with powerful filters';
}

// Path: hiddenActions.diagnostics
class _TranslationsHiddenActionsDiagnosticsEn implements TranslationsHiddenActionsDiagnosticsAr {
	_TranslationsHiddenActionsDiagnosticsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diagnostics';
	@override String get subtitle => 'Share logs and device/network info';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appTitle': return 'AL-Manasa PoC';
			case 'loginTitle': return 'Login to your\nAccount';
			case 'loginSubtitle': return 'Enter your work email and password to log in';
			case 'email': return 'Email';
			case 'enterEmail': return 'Enter Email';
			case 'password': return 'Password';
			case 'enterPassword': return 'Enter Password';
			case 'login': return 'Login';
			case 'request_cancelled': return 'Request was cancelled';
			case 'connection_timeout': return 'Connection timed out';
			case 'receive_timeout': return 'Receiving data timed out';
			case 'send_timeout': return 'Sending data timed out';
			case 'no_internet': return 'No internet connection';
			case 'response_data_not_found': return 'Response data not found';
			case 'unexpected_error': return 'An unexpected error occurred';
			case 'default_error_message': return 'Something went wrong, please try again';
			case 'bad_request': return 'Bad request';
			case 'unauthorized': return 'Unauthorized access';
			case 'error_403_forbidden': return 'Access is forbidden';
			case 'error_404_not_found': return 'Requested resource not found';
			case 'session_expired': return 'Session has expired';
			case 'internal_server_error': return 'Internal server error';
			case 'server_unavailable': return 'Server is unavailable';
			case 'something_went_wrong': return 'Something went wrong';
			case 'unknownError': return 'An unknown error occurred.';
			case 'connectionError': return 'Connection error. Please check your internet.';
			case 'invalidCredentials': return 'Invalid credentials. Please try again.';
			case 'usedEmail': return 'This email is already in use.';
			case 'needAuth': return 'Please Login In Again.';
			case 'loginExpired': return 'Login session has expired.';
			case 'proceed': return 'Continue';
			case 'failedGoogleAuth': return 'Google authentication failed.';
			case 'retry': return 'Retry';
			case 'homePage.matches.title': return 'Matches';
			case 'homePage.matches.empty': return 'No matches scheduled for today.';
			case 'homePage.matches.live': return 'Live';
			case 'homePage.matches.upcoming': return 'Upcoming';
			case 'seasons': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Season',
				other: 'Seasons',
			);
			case 'profile.accountSettings': return 'Account Settings';
			case 'profile.subscription': return 'Subscription';
			case 'profile.vouchers': return 'Vouchers';
			case 'profile.language': return 'Language';
			case 'profile.privacyPolicy': return 'Privacy Policy';
			case 'profile.hiddenActions': return 'QA Options';
			case 'profile.chooseLanguage': return 'Choose the language';
			case 'profile.arabic': return 'عربي';
			case 'profile.english': return 'English';
			case 'loggingOut': return 'Logging out?';
			case 'logoutConfirmation': return 'Are you sure you want to logout from Almanasa?';
			case 'logout': return 'Logout';
			case 'cancel': return 'Cancel';
			case 'auth.mainDescription': return 'Discover Almanasa—your gateway\nto premium entertainment!';
			case 'auth.subDescription': return 'Movies • TV Shows • Matches';
			case 'auth.releaseDate': return 'Coming on March 8';
			case 'auth.signUp': return 'Sign Up';
			case 'auth.alreadyHaveAccount': return 'Already have an account? ';
			case 'auth.authenticationFailed': return 'Authentication failed please try again';
			case 'navigation.home': return 'Home';
			case 'navigation.explore': return 'Explore';
			case 'navigation.search': return 'Search';
			case 'navigation.profile': return 'Profile';
			case 'searchPage.search': return 'Search';
			case 'searchPage.noResultsFound': return 'No results found';
			case 'searchPage.resultsFound': return 'results found';
			case 'searchPage.topResults': return 'Top Results';
			case 'searchPage.movies': return 'Movies';
			case 'searchPage.tvShows': return 'TV\nShows';
			case 'searchPage.tvChannels': return 'TV\nChannels';
			case 'searchPage.matches': return 'Matches';
			case 'searchPage.catchup': return 'Sports';
			case 'searchPage.browse': return 'Browse';
			case 'searchPage.searchFailed': return 'Failed to search. Please try again.';
			case 'searchPage.unknown': return 'Unknown';
			case 'contentTypes.movie': return 'Movies';
			case 'contentTypes.series': return 'Series';
			case 'contentTypes.catchup': return 'Sports';
			case 'contentTypes.sport': return 'Sports';
			case 'contentTypes.documentary': return 'Documentary';
			case 'contentTypes.tvShow': return 'TV Shows';
			case 'contentTypes.other': return 'Other';
			case 'homeSlider.signUpToWatch': return 'Sign up to watch';
			case 'homeSlider.watchNow': return 'Watch Now';
			case 'homeTabs.home': return 'Home';
			case 'homeTabs.movies': return 'Movies';
			case 'homeTabs.matches': return 'Matches';
			case 'homeTabs.music': return 'Music';
			case 'homeTabs.tvChannels': return 'TV Channels';
			case 'sections.categories': return 'Categories';
			case 'sections.popularChannels': return 'Popular Channels';
			case 'episodes.episodePrefix': return 'Episode';
			case 'episodes.episodeNumber': return 'Episode {number}';
			case 'episodes.episodes': return 'Episodes';
			case 'episodes.demo': return '* demo';
			case 'live': return 'LIVE';
			case 'splash.unknownErrorMessage': return 'Unknown error happened, please update the app or wait until it is fixed';
			case 'splash.retryNow': return 'Retry Now';
			case 'splash.errorPrefix': return 'Error: ';
			case 'explore.title': return 'NEURAL EXPLORER';
			case 'explore.loadingStreams': return 'LOADING DATA STREAMS...';
			case 'explore.connectionError': return 'CONNECTION ERROR';
			case 'explore.failedToLoadStreams': return 'Failed to load data streams';
			case 'explore.noStreamsFound': return 'NO DATA STREAMS FOUND';
			case 'explore.adjustFilters': return 'Adjust neural filters to discover content';
			case 'explore.navigationError': return 'NAVIGATION ERROR';
			case 'explore.contentUnavailable': return 'CONTENT DATA UNAVAILABLE';
			case 'explore.episodeUnavailable': return 'EPISODE DATA UNAVAILABLE';
			case 'explore.unknown': return 'Unknown';
			case 'explore.unknownEpisode': return 'Unknown Episode';
			case 'explore.summary.showingAllPrefix': return 'SHOWING ALL';
			case 'explore.summary.filteredPrefix': return 'FILTERED:';
			case 'explore.summary.streams': return 'STREAMS';
			case 'explore.summary.localFilters': return 'LOCAL FILTERS';
			case 'explore.summary.loadingLocalFilters': return 'APPLYING LOCAL NEURAL FILTERS...';
			case 'explore.summary.filterErrorDetected': return 'FILTER ERROR DETECTED';
			case 'explore.summary.mixed': return 'MIXED';
			case 'explore.summary.movie': return 'MOVIE';
			case 'explore.summary.series': return 'SERIES';
			case 'explore.summary.recording': return 'RECORDING';
			case 'explore.summary.channel': return 'CHANNEL';
			case 'explore.filters.header': return 'NEURAL FILTERS';
			case 'explore.filters.contentType': return 'CONTENT TYPE';
			case 'explore.filters.providers': return 'PROVIDERS';
			case 'explore.filters.streamFormat': return 'STREAM FORMAT';
			case 'explore.filters.contentFeatures': return 'CONTENT FEATURES';
			case 'explore.filters.active': return 'ACTIVE';
			case 'explore.filters.reset': return 'RESET';
			case 'explore.filters.movies': return 'MOVIES';
			case 'explore.filters.series': return 'SERIES';
			case 'explore.filters.recordings': return 'RECORDINGS';
			case 'explore.filters.channels': return 'CHANNELS';
			case 'explore.filters.premium': return 'PREMIUM';
			case 'explore.filters.multipleMp4': return 'MULTIPLE MP4 FILES';
			case 'explore.filters.nonAdaptiveWithSubtitles': return 'NON-ADAPTIVE WITH SUBTITLES';
			case 'explore.filters.oneStreamOnly': return 'ONE STREAM ONLY';
			case 'explore.filters.resetAllData': return 'Reset All Data';
			case 'explore.filters.resetConfirmWithCache': return 'This will permanently delete all cached explore data, filters, and settings. This action cannot be undone. Are you sure you want to proceed?';
			case 'explore.filters.resetConfirmNoCache': return 'No cached data found. Reset will clear any remaining filters and settings. This action cannot be undone. Are you sure you want to proceed?';
			case 'explore.filters.resetAll': return 'Reset All';
			case 'explore.filters.resetSuccess': return 'Explore data and filters have been reset!';
			case 'explore.filters.resetOfflineData': return 'RESET OFFLINE DATA';
			case 'explore.filters.resetting': return 'Resetting...';
			case 'explore.filters.import': return 'IMPORT';
			case 'explore.filters.importing': return 'Importing...';
			case 'explore.filters.importSuccess': return 'Explore data imported successfully!';
			case 'explore.filters.importFailed': return 'Failed to import data. Invalid file format.';
			case 'explore.filters.noFileSelected': return 'No file selected';
			case 'explore.filters.importErrorPrefix': return 'Import error';
			case 'explore.filters.export': return 'EXPORT';
			case 'explore.filters.exporting': return 'Exporting...';
			case 'explore.filters.exportSuccessTitle': return 'Export Successful';
			case 'explore.filters.exportSuccessTo': return 'Explore data exported to:';
			case 'explore.filters.ok': return 'OK';
			case 'explore.filters.share': return 'Share';
			case 'explore.filters.exportFailed': return 'Failed to export data';
			case 'explore.filters.exportErrorPrefix': return 'Export error';
			case 'explore.filters.cacheFoundTitle': return 'Cache Found';
			case 'explore.filters.cacheFoundMessage': return 'There is already cached explore data available. Loading fresh data from the API will replace the existing cache. Do you want to proceed?';
			case 'explore.filters.loadDataSuccess': return 'Explore data loaded successfully!';
			case 'explore.filters.loadDataFailedPrefix': return 'Failed to load data';
			case 'explore.filters.loading': return 'Loading...';
			case 'explore.filters.loadExploreData': return 'LOAD EXPLORE DATA';
			case 'explore.episodes.available': return 'EPISODES AVAILABLE';
			case 'explore.episodes.playSeries': return 'PLAY SERIES';
			case 'explore.episodes.noSeasons': return 'No seasons available';
			case 'explore.episodes.tapToExpand': return 'TAP TO EXPAND EPISODES';
			case 'explore.episodes.seasons': return 'SEASONS';
			case 'explore.episodes.seasonLabel': return 'SEASON';
			case 'explore.episodes.noEpisodesFound': return 'NO EPISODES FOUND';
			case 'explore.episodes.seasonMayNotBeAvailable': return 'Season {season} may not be available';
			case 'explore.episodes.hologramMatrix': return 'HOLOGRAM EPISODE MATRIX';
			case 'explore.episodes.unknownFormat': return 'UNK';
			case 'explore.episodes.epPrefix': return 'EP ';
			case 'explore.info.unknownDataStream': return 'UNKNOWN DATA STREAM';
			case 'explore.info.ratedPrefix': return 'RATED ';
			case 'explore.info.genres': return 'GENRES';
			case 'explore.info.release': return 'RELEASE';
			case 'explore.info.provider': return 'PROVIDER';
			case 'explore.info.noVisualData': return 'NO VISUAL DATA';
			case 'errorMessage.noNextEpisode': return 'لا يوجد حلقة تالية للمشاهدة';
			case 'diagnostics.title': return 'Diagnostics';
			case 'diagnostics.shareLogs': return 'Share Logs';
			case 'diagnostics.resetLogs': return 'Reset Logs';
			case 'diagnostics.preparingDiagnostics': return 'Preparing diagnostics...';
			case 'diagnostics.errorLoadingDiagnostics': return 'Error loading diagnostics';
			case 'diagnostics.retry': return 'Retry';
			case 'diagnostics.shareLogsAndDeviceInfo': return 'Share logs and device info with the developer';
			case 'diagnostics.preparing': return 'Preparing...';
			case 'diagnostics.shareDiagnostics': return 'Share Diagnostics';
			case 'diagnostics.clearLogs': return 'Clear Logs';
			case 'diagnostics.preparingLogs': return 'Preparing logs...';
			case 'diagnostics.internetSpeed': return 'Internet Speed';
			case 'diagnostics.download': return 'Download';
			case 'diagnostics.upload': return 'Upload';
			case 'diagnostics.testing': return 'Testing...';
			case 'diagnostics.testSpeed': return 'Test Speed';
			case 'diagnostics.storageDetails': return 'Storage Details';
			case 'diagnostics.logFileSize': return 'Log File Size';
			case 'diagnostics.clearLogsNote': return 'Clear logs when not needed to save storage space';
			case 'diagnostics.totalRecorded': return 'Total recorded';
			case 'diagnostics.storageCapacity': return 'Storage capacity';
			case 'diagnostics.activeFile': return 'Active file';
			case 'diagnostics.updated': return 'Updated';
			case 'diagnostics.resetLogsTitle': return 'Reset Logs';
			case 'diagnostics.resetLogsMessage': return 'This will delete all log files and start fresh. Continue?';
			case 'diagnostics.cancel': return 'Cancel';
			case 'diagnostics.reset': return 'Reset';
			case 'diagnostics.shareLogsSubject': return 'Diagnostics logs';
			case 'diagnostics.networkStatus.unknown': return 'Unknown';
			case 'diagnostics.networkStatus.notConnected': return 'Not connected';
			case 'diagnostics.networkStatus.notAvailable': return 'Not available';
			case 'diagnostics.networkStatus.notTested': return 'Not tested';
			case 'diagnostics.networkStatus.starting': return 'Starting...';
			case 'diagnostics.networkStatus.selectingServer': return 'Selecting server...';
			case 'diagnostics.networkStatus.failed': return 'Failed';
			case 'diagnostics.networkStatus.wifi': return 'Wi-Fi';
			case 'diagnostics.networkStatus.mobileData': return 'Mobile Data';
			case 'diagnostics.networkStatus.ethernet': return 'Ethernet';
			case 'diagnostics.networkStatus.offline': return 'Offline';
			case 'diagnostics.networkStatus.mobileNetwork': return 'Mobile network';
			case 'diagnostics.networkStatus.wiredConnection': return 'Wired connection';
			case 'diagnostics.networkStatus.noConnection': return 'No connection';
			case 'diagnostics.networkStatus.error': return 'Error';
			case 'diagnostics.logRecording.title': return 'Log Recording';
			case 'diagnostics.logRecording.subtitle': return 'Enable automatic log recording for troubleshooting';
			case 'diagnostics.logRecording.enabled': return 'Enabled';
			case 'diagnostics.logRecording.disabled': return 'Disabled';
			case 'diagnostics.speedTest.completed': return 'Completed';
			case 'diagnostics.speedTest.notTested': return 'Not tested';
			case 'diagnostics.speedTest.defaultServer': return 'Default (flutter_speed_test_plus)';
			case 'hiddenActions.title': return 'Hidden Actions';
			case 'hiddenActions.subtitle': return 'Where would you like to go?';
			case 'hiddenActions.explore.title': return 'Explore';
			case 'hiddenActions.explore.subtitle': return 'Discover content with powerful filters';
			case 'hiddenActions.diagnostics.title': return 'Diagnostics';
			case 'hiddenActions.diagnostics.subtitle': return 'Share logs and device/network info';
			case 'subscription.title': return 'Subscription';
			case 'subscription.chooseYourSubscription': return 'Choose Your Subscription';
			case 'subscription.chooseYourPlan': return 'Choose your plan and enjoy series, movies, and live channels.';
			case 'subscription.plusSubscription': return 'Plus Subscription';
			case 'subscription.voucher': return 'Voucher';
			case 'subscription.voucherDescription': return 'Do you have a voucher? Enter the voucher code to activate your plan';
			case 'subscription.continueButton': return 'Continue';
			case 'subscription.yourSubscription': return 'Your Subscription';
			case 'subscription.manageSubscription': return 'Manage Subscription';
			case 'subscription.openingSubscriptionManagement': return 'Opening subscription management...';
			case 'subscription.active': return 'Active';
			case 'subscription.expiresOn': return ({required InlineSpan date}) => TextSpan(children: [
				const TextSpan(text: 'Expires on: '),
				date,
			]);
			case 'subscription.redeemYourVoucher': return 'Redeem Your Voucher';
			case 'subscription.enterVoucherCode': return 'Enter your 16 digits voucher code';
			case 'subscription.whereCanIGetVoucher': return 'Where can I get a voucher?';
			case 'subscription.buyVouchersFromResellers': return 'Buy vouchers from our trusted resellers';
			case 'subscription.watchHowToActivate': return 'Watch how to activate your voucher';
			case 'subscription.unlimitedAccess': return 'Unlimited access to movies, shows, and live sports with no ads.';
			case 'subscription.perMonth': return '/Per Month';
			case 'subscription.voucherSubscription': return 'Voucher Subscription';
			default: return null;
		}
	}
}

