import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/network/daangn_api.dart';

final productPostProvider = AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  return await DaangnApi.getPost(id);
});