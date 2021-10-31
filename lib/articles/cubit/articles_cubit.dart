import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/article.model.dart';
import '../repository/articles_repository.dart';
import '../../common/model/failure.dart';
import '../../common/model/load_status.enum.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.repository}) : super(ArticlesState.initial()) {
    getArticles();
  }

  ArticleRepository repository;

  void getArticles() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final articles = await repository.getArticles();

      emit(state.copyWith(loadStatus: LoadStatus.loaded, article: articles));
    } catch (e, s) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.error,
          failure: Failure(e, s),
        ),
      );
    }
  }
}
