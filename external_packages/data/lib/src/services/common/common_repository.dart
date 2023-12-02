import 'package:data/src/model/model.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import 'cms_content_model.dart';
import 'contact_us_model.dart';
import 'faq_model.dart';
import 'security_question_model.dart';

@lazySingleton
class CommonRepository extends BaseRepository {
  CommonRepository({
    required super.dio,
    required super.cacheService,
  });

  final String _pathPrefix = "common/";

  Stream<DataEvent<List<SecurityQuestion>>> getSecurityQuestions() async* {
    final request = ApiRequest<List<SecurityQuestion>>(RequestType.get, "${_pathPrefix}questionList")
      ..responseParser = (value) => parseListFromJson(value, SecurityQuestion.fromJson);
    yield* processApi(request);
  }

  Stream<DataEvent<CmsContent>> getPrivacyPolicy() async* {
    final request = ApiRequest<CmsContent>(
      RequestType.get,
      "${_pathPrefix}privacy-policy",
      responseParser: (responseData) => CmsContent.fromJson(responseData),
    );
    yield* processApi(request);
  }

  Stream<DataEvent<CmsContent>> getTermsAndCondition() async* {
    final request = ApiRequest<CmsContent>(
      RequestType.get,
      "${_pathPrefix}terms-and-condition",
      responseParser: (responseData) => CmsContent.fromJson(responseData),
    );
    yield* processApi(request);
  }

  Stream<DataEvent<List<FaqQuestionGroup>>> getFaqList() async* {
    final request = ApiRequest<List<FaqQuestionGroup>>(RequestType.get, "${_pathPrefix}allFaq")
      ..responseParser = (value) {
        final questionGroups = <FaqGroup, List<FaqQuestion>>{};
        parseListFromJson(value, FaqQuestion.fromJson).forEach((value) {
          questionGroups[value.group] = (questionGroups[value.group] ?? [])..add(value);
        });
        return questionGroups.entries.map((e) => FaqQuestionGroup(info: e.key, questions: e.value)).toList();
      };
    yield* processApi(request);
  }

  Stream<DataEvent<ContactUsInfo>> getContactInfo() async* {
    final request = ApiRequest<ContactUsInfo>(RequestType.get, "${_pathPrefix}listContactus",
        responseParser: (responseData) => ContactUsInfo.fromJson(responseData));
    yield* processApi(request);
  }
}
