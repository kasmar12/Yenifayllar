.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonUserDetails"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails$Builder;
    }
.end annotation


# instance fields
.field private providerData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private userInfo:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;"
        }
    .end annotation

    .line 1163
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;-><init>()V

    const/4 v1, 0x0

    .line 1164
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 1166
    :cond_0
    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    move-result-object v1

    .line 1165
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->setUserInfo(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;)V

    const/4 v1, 0x1

    .line 1167
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 1168
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->setProviderData(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getProviderData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 1117
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->providerData:Ljava/util/List;

    return-object v0
.end method

.method public getUserInfo()Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;
    .locals 1

    .line 1104
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->userInfo:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    return-object v0
.end method

.method public setProviderData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 1124
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->providerData:Ljava/util/List;

    return-void

    .line 1122
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"providerData\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUserInfo(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1111
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->userInfo:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    return-void

    .line 1109
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"userInfo\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1156
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1157
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->userInfo:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserInfo;->toList()Ljava/util/ArrayList;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1158
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserDetails;->providerData:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
