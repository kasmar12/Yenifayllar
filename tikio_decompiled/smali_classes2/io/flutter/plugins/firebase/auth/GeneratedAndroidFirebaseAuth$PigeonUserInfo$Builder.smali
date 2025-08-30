.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private creationTimestamp:Ljava/lang/Long;

.field private displayName:Ljava/lang/String;

.field private email:Ljava/lang/String;

.field private isAnonymous:Ljava/lang/Boolean;

.field private isEmailVerified:Ljava/lang/Boolean;

.field private lastSignInTimestamp:Ljava/lang/Long;

.field private phoneNumber:Ljava/lang/String;

.field private photoUrl:Ljava/lang/String;

.field private providerId:Ljava/lang/String;

.field private refreshToken:Ljava/lang/String;

.field private tenantId:Ljava/lang/String;

.field private uid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 937
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;
    .locals 2

    .line 1024
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;-><init>()V

    .line 1025
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->uid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setUid(Ljava/lang/String;)V

    .line 1026
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setEmail(Ljava/lang/String;)V

    .line 1027
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setDisplayName(Ljava/lang/String;)V

    .line 1028
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->photoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setPhotoUrl(Ljava/lang/String;)V

    .line 1029
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setPhoneNumber(Ljava/lang/String;)V

    .line 1030
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->isAnonymous:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setIsAnonymous(Ljava/lang/Boolean;)V

    .line 1031
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->isEmailVerified:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setIsEmailVerified(Ljava/lang/Boolean;)V

    .line 1032
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->providerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setProviderId(Ljava/lang/String;)V

    .line 1033
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->tenantId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setTenantId(Ljava/lang/String;)V

    .line 1034
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->refreshToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setRefreshToken(Ljava/lang/String;)V

    .line 1035
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->creationTimestamp:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setCreationTimestamp(Ljava/lang/Long;)V

    .line 1036
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->lastSignInTimestamp:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->setLastSignInTimestamp(Ljava/lang/Long;)V

    return-object v0
.end method

.method public setCreationTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 1012
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->creationTimestamp:Ljava/lang/Long;

    return-object p0
.end method

.method public setDisplayName(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 956
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method

.method public setEmail(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 949
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->email:Ljava/lang/String;

    return-object p0
.end method

.method public setIsAnonymous(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 977
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->isAnonymous:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIsEmailVerified(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 984
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->isEmailVerified:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setLastSignInTimestamp(Ljava/lang/Long;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 1019
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->lastSignInTimestamp:Ljava/lang/Long;

    return-object p0
.end method

.method public setPhoneNumber(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 970
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->phoneNumber:Ljava/lang/String;

    return-object p0
.end method

.method public setPhotoUrl(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 963
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->photoUrl:Ljava/lang/String;

    return-object p0
.end method

.method public setProviderId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 991
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->providerId:Ljava/lang/String;

    return-object p0
.end method

.method public setRefreshToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 1005
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->refreshToken:Ljava/lang/String;

    return-object p0
.end method

.method public setTenantId(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 998
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->tenantId:Ljava/lang/String;

    return-object p0
.end method

.method public setUid(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;
    .locals 0

    .line 942
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo$Builder;->uid:Ljava/lang/String;

    return-object p0
.end method
