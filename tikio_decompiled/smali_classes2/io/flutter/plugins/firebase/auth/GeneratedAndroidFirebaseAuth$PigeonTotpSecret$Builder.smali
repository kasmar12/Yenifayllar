.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private codeIntervalSeconds:Ljava/lang/Long;

.field private codeLength:Ljava/lang/Long;

.field private enrollmentCompletionDeadline:Ljava/lang/Long;

.field private hashingAlgorithm:Ljava/lang/String;

.field private secretKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;
    .locals 2

    .line 2229
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;-><init>()V

    .line 2230
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->codeIntervalSeconds:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;->setCodeIntervalSeconds(Ljava/lang/Long;)V

    .line 2231
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->codeLength:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;->setCodeLength(Ljava/lang/Long;)V

    .line 2232
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->enrollmentCompletionDeadline:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;->setEnrollmentCompletionDeadline(Ljava/lang/Long;)V

    .line 2233
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->hashingAlgorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;->setHashingAlgorithm(Ljava/lang/String;)V

    .line 2234
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->secretKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret;->setSecretKey(Ljava/lang/String;)V

    return-object v0
.end method

.method public setCodeIntervalSeconds(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
    .locals 0

    .line 2196
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->codeIntervalSeconds:Ljava/lang/Long;

    return-object p0
.end method

.method public setCodeLength(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
    .locals 0

    .line 2203
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->codeLength:Ljava/lang/Long;

    return-object p0
.end method

.method public setEnrollmentCompletionDeadline(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
    .locals 0

    .line 2210
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->enrollmentCompletionDeadline:Ljava/lang/Long;

    return-object p0
.end method

.method public setHashingAlgorithm(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
    .locals 0

    .line 2217
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->hashingAlgorithm:Ljava/lang/String;

    return-object p0
.end method

.method public setSecretKey(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;
    .locals 0

    .line 2224
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonTotpSecret$Builder;->secretKey:Ljava/lang/String;

    return-object p0
.end method
