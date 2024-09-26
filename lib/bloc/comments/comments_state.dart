part of 'comments_bloc.dart';


sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsDetails extends CommentsState {
  final List<Comment> commentList;
  CommentsDetails(this.commentList);
}

final class FailedState extends CommentsState {}