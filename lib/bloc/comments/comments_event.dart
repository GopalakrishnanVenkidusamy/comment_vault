part of 'comments_bloc.dart';

sealed class CommentsEvent {}

final class GetComments extends CommentsEvent{}
final class GetMailMaskStatus extends CommentsEvent{}