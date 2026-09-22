enum UserRole { user, mechanic, admin }

class AppUser {
  final String id;
  final String name;
  final String email;
  final String password;
  UserRole role; // Mutable, so we can set it when they select it on the Homepage

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.role = UserRole.user, // Default, but will be overwritten on Homepage
  });
}

enum IssueStatus { pending, accepted, resolved, disputed }

class Issue {
  final String id;
  final String userId;
  final String userName;
  String? mechanicId;
  String? mechanicName;
  final String description;
  IssueStatus status;

  double extraCharges;
  String? feedback;

  Issue({
    required this.id,
    required this.userId,
    required this.userName,
    this.mechanicId,
    this.mechanicName,
    required this.description,
    this.status = IssueStatus.pending,
    this.extraCharges = 0.0,
    this.feedback,
  });
}