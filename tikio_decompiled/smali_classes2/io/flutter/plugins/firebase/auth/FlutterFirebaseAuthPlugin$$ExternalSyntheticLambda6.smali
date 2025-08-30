.class public final synthetic Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/firebase/auth/PhoneNumberVerificationStreamHandler$OnCredentialsListener;


# static fields
.field public static final synthetic INSTANCE:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;->INSTANCE:Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin$$ExternalSyntheticLambda6;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCredentialsReceived(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 0

    invoke-static {p1}, Lio/flutter/plugins/firebase/auth/FlutterFirebaseAuthPlugin;->lambda$verifyPhoneNumber$15(Lcom/google/firebase/auth/PhoneAuthCredential;)V

    return-void
.end method
