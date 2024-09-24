import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickname: '홍길동',
  profileUrl: picSum(1010),
  temperature: 36.5,
);

final user2 = User(
  id: 1,
  nickname: '바다',
  profileUrl: picSum(900),
  temperature: 36.5,
);

final user3 = User(
  id: 1,
  nickname: '파도',
  profileUrl: picSum(700),
  temperature: 36.5,
);

final product1 = Product(
  user1,
  '아이폰 13',
  700000,
  '깨끗하게 잘 쓰던 물건이예요.'
      '잘 쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [
    picSum(100),
    picSum(101),
    picSum(102),
  ],
);

final product2 = Product(
  user2,
  '스마트 티비',
  120000,
  '깨끗하게 잘 쓰던 물건이예요.'
      '잘 쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [
    picSum(300),
    picSum(301),
    picSum(302),
  ],
);

final product3 = Product(
  user3,
  '아이폰 13',
  700000,
  '깨끗하게 잘 쓰던 물건이예요.'
      '잘 쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [
    picSum(500),
    picSum(501),
    picSum(502),
  ],
);

final post1 = ProductPost(
  product1.user,
  product1,
  product1.name,
  const Address('서울', '앱동'),
  1,
  3,
  DateTime.now().subtract(5.minutes),
);

final post2 = ProductPost(
  product2.user,
  product2,
  product2.name,
  const Address('서울', '앱동'),
  2,
  5,
  DateTime.now().subtract(30.minutes),
);

final post3 = ProductPost(
  product3.user,
  product3,
  product3.name,
  const Address('서울', '앱동'),
  1,
  8,
  DateTime.now().subtract(5.minutes),
);

final postList = [post1, post2, post3, post1, post2, post3,];