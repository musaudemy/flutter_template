class AuthRequest {
  final String? refreshToken;

  AuthRequest({
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return {
      "refresh_token": refreshToken,
    };
  }
}
