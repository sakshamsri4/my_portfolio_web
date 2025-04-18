/// Base interface for all repositories
abstract class RepositoryInterface {
  /// Initialize the repository
  Future<void> initialize();

  /// Dispose repository resources
  void dispose();
}
