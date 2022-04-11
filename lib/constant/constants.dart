import 'package:image_ui_demo/model/feature_lab.dart';
import 'package:image_ui_demo/model/full_body_check.dart';
import 'package:image_ui_demo/model/health_check_categories.dart';
import 'package:image_ui_demo/model/health_check_up_home.dart';
import 'package:image_ui_demo/model/pathology_tests.dart';
import 'package:image_ui_demo/model/radiologist_tests.dart';

class Constants {
  static const String labTest = 'LAB_TEST';
  static const String splashScreen = 'SPLASH_SCREEN';

  static List<RadiologyTests> getRadiologyTestList() {
    return [
      RadiologyTests('USG Whole Adbomen', 'Ultrasound Whole Abdomen',
          'Provided By 9 Labs', '50% Coupon', 'MRP', '₹1200', '₹600', 'ADD'),
      RadiologyTests('X - Ray Chest PA View', '', 'Provided By 7 Labs',
          '50% Coupon', 'MRP', '₹170', '₹170', 'ADD'),
      RadiologyTests('MRI Brain', '', 'Provided By 6 Labs', '50% Coupon', 'MRP',
          '₹170', '₹170', 'ADD'),
      RadiologyTests('CT Head', 'CT Brain/NCCT Head', 'Provided By 6 Labs',
          '50% Coupon', 'MRP', '₹170', '₹170', 'ADD'),
      RadiologyTests('PET CT Scan (Whole Body)', '', 'Provided By 3 Labs',
          '50% Coupon', 'MRP', '₹170', '₹170', 'ADD'),
      RadiologyTests('MRI Lummbosacral', '', 'Provided By 6 Labs', '50% Coupon',
          'MRP', '₹6000', '₹3000', 'ADD'),
    ];
  }

  static List<FeatureLab> getFeatureLabTestList() {
    return [
      FeatureLab('assets/images/1mglabs_1.webp', '1mglabs'),
      FeatureLab('assets/images/dr.lalpathlabs.webp', 'Dr. Lal PathLabs Ltd.'),
      FeatureLab('assets/images/srl.webp', 'SRL Limited'),
      FeatureLab('assets/images/thyrocare.webp', 'Thyrocare Laboratries Ltd.'),
      FeatureLab(
          'assets/images/Metropolis-logo_new.webp', 'Metropolis Laboratries'),
      FeatureLab(
          'assets/images/mahajanimaging.jpg', 'Mahajan Imaging Centre (HZ)'),
    ];
  }

  static List<HealthCheckUpHome> getFullCheckHomeTestList() {
    return [
      HealthCheckUpHome(
          'Good Health Premium Package with carditnal',
          'Includes 81 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '50% Coupon',
          'MRP',
          '₹3199',
          '₹1599',
          'ADD'),
      HealthCheckUpHome(
          'Good Health Package',
          'Includes 60 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '25% Off + 50% Coupon',
          'MRP',
          '₹1600',
          '₹599',
          'ADD'),
      HealthCheckUpHome(
          'Summer Special Health Checkup',
          'Includes 63 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '9% Off + 50% Coupon',
          'MRP',
          '₹2200',
          '₹999',
          'ADD'),
      HealthCheckUpHome(
          'Summer Special Health Checkup',
          'Includes 63 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '9% Off + 50% Coupon',
          'MRP',
          '₹2200',
          '₹999',
          'ADD'),
      HealthCheckUpHome(
          'Comperehensive Full Body Checkp',
          'Includes 95 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '78% Off + 50% Coupon',
          'MRP',
          '₹10500',
          '₹1149',
          'ADD'),
    ];
  }

  static List<FullBodyCheck> getFullBodyCheckTestList() {
    return [
      FullBodyCheck(
          'Aarogyam 1.3',
          'Includes 64 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹725',
          'ADD'),
      FullBodyCheck(
          'Basic Body Profile',
          'Includes 65 tests',
          'assets/images/Pathcare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹1600',
          '₹599',
          'ADD'),
      FullBodyCheck(
          'Aarogyam 1.2',
          'Includes 64 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Basic Health Package',
          'Includes 64 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Personalized Full Body Checkup',
          'Includes 64 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Swasth Plus Health Advance Panel',
          'Includes 64 tests',
          'assets/images/dr.lalpathlabs.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Aarogyam 1.7',
          'Includes 89 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Aarogyam 1.4',
          'Includes 75 tests',
          'assets/images/thyrocare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Basic Health Screening (includes)',
          'Includes 29 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Full Body Panel (includes 52 tests)',
          'Includes 52 tests',
          'assets/images/Medcis.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Diwali Special Package',
          'Includes 63 tests',
          'assets/images/1mglabs_1.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
      FullBodyCheck(
          'Whole Body Screening (includes)',
          'Includes 60 tests',
          'assets/images/Pathcare.webp',
          '4.7',
          'NABL,ISO',
          '34% Off 25% Coupon',
          'MRP',
          '₹2200',
          '₹1087',
          'ADD'),
    ];
  }

  static List<HealthCheckCategories> getHealthCategoriesList() {
    return [
      HealthCheckCategories('assets/images/thyrocare.webp', 'Diabetes'),
      HealthCheckCategories(
          'assets/images/Pathcare.webp', 'Full Body Check Up'),
      HealthCheckCategories('assets/images/Pathcare.webp', 'Woman Health'),
      HealthCheckCategories('assets/images/1mglabs_1.webp', 'Healthy Men'),
      HealthCheckCategories(
          'assets/images/Medcis.webp', 'Senior Citizen Checkup'),
      HealthCheckCategories('assets/images/1mglabs_1.webp', 'Vitamin Tests'),
      HealthCheckCategories('assets/images/thyrocare.webp', 'Healthy Bones'),
      HealthCheckCategories('assets/images/Medcis.webp', 'Pregnancy'),
      HealthCheckCategories(
          'assets/images/dr.lalpathlabs.webp', 'Hormone Tests'),
    ];
  }

  static List<PathologyTests> getPathologyTestList() {
    return [
      PathologyTests('Complete Blood Count', 'CBP', 'Provided By 17 Labs', '',
          '', '', '₹300', 'ADDED'),
      PathologyTests('Thyroid Stimulating Hormone', 'Thyrotropin',
          'Provided By 18 Labs', '', '', '', '₹300', 'ADD'),
      PathologyTests('Kideny Function Test', 'Reneal Function Test',
          'Provided By 16 Labs', '50% Coupon', 'MRP', '₹500', '₹250', 'ADD'),
      PathologyTests('GLycosylated Hemoglobin', 'GLycated Hemoglobin',
          'Provided By 18 Labs', '50% Coupon', 'MRP', '₹170', '₹300', 'ADD'),
      PathologyTests('Liqid Profile', '', 'Provided By 18 Labs', '50% Coupon',
          'MRP', '₹500', '₹250', 'ADD'),
      PathologyTests('Dengue Antigen NS1, IgC & IgM', '', 'Provided By 18 Labs',
          '50% Coupon', 'MRP', '₹1045', '₹522', 'ADD'),
      PathologyTests('Liver function Test', 'Hepatic function Test',
          'Provided By 18 Labs', '50% Coupon', 'MRP', '₹600', '₹300', 'ADD'),
      PathologyTests('Thyroid Profile Total', 'Thyroid Function Test',
          'Provided By 15 Labs', '50% Coupon', 'MRP', '₹170', '₹300', 'ADD'),
    ];
  }

  static List<String> getCarouselList() {
    return [
      'assets/images/1mg.jpg',
      'assets/images/MedicineOffer.png',
      'assets/images/HealthProductImage.png',
      'assets/images/LabTestImage.png',
    ];
  }
}
