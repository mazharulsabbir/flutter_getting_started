import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  // TODO: change ad unit id
  final String _bannerAdUnitId = BannerAd.testAdUnitId;
  final String _interestitialAdUnitId = InterstitialAd.testAdUnitId;
  final String _nativeAdUnitId = NativeAd.testAdUnitId;
  final String _rewardAdUnitId = RewardedAd.testAdUnitId;

  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  final AdRequest _adRequest = const AdRequest(nonPersonalizedAds: false);

  @override
  void onInit() {
    super.onInit();
    debugPrint('AdsController onInit');

    _loadInterstitialAd();
    _loadRewardVideoAd();
  }

  // ==== BANNER AD ====

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
  );

  BannerAd getBannerAd() {
    BannerAd _bannerAd = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: _adRequest,
      listener: listener,
    );

    _bannerAd.load();
    return _bannerAd;
  }

  // ==== INTERSTITIAL AD ====

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _interestitialAdUnitId,
      request: _adRequest,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
          _loadInterstitialAd();
        },
      ),
    );
  }

  void showInterstitialAd() {
    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          debugPrint('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _loadInterstitialAd();
      },
      onAdImpression: (InterstitialAd ad) =>
          debugPrint('$ad impression occurred.'),
    );

    _interstitialAd?.show();
  }

  // ==== REWARD VIDEO AD ====

  void _loadRewardVideoAd() {
    RewardedAd.load(
      adUnitId: _rewardAdUnitId,
      request: _adRequest,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showRewardVideoAd() {
    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          debugPrint('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => debugPrint('$ad impression occurred.'),
    );

    _rewardedAd?.show(
        onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
      // Reward the user for watching an ad.
      _loadRewardVideoAd();
    });
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('AdsController onClose');
  }
}
