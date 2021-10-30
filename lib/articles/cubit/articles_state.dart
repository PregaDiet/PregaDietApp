part of 'articles_cubit.dart';

class ArticlesState extends Equatable {
  final List<Article> article;
  final LoadStatus loadStatus;
  final Failure failure;

  ArticlesState({
    required this.article,
    required this.loadStatus,
    required this.failure,
  });

  factory ArticlesState.initial() {
    return ArticlesState(
      article: [],
      loadStatus: LoadStatus.initial,
      failure: Failure(),
    );
  }

  @override
  List<Object> get props => [
        article,
        loadStatus,
        failure,
      ];

  ArticlesState copyWith({
    List<Article>? article,
    LoadStatus? loadStatus,
    Failure? failure,
  }) {
    return ArticlesState(
      article: article ?? this.article,
      loadStatus: loadStatus ?? this.loadStatus,
      failure: failure ?? this.failure,
    );
  }
}
