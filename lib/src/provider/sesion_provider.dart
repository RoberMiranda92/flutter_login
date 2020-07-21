class SessionProvider {
  static final SessionProvider _instance = SessionProvider._();

  String uid;
  SessionProvider._();

  String token; 
  static SessionProvider get instance => _instance;
}
