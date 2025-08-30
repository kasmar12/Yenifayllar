.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonUserProfile"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile$Builder;
    }
.end annotation


# instance fields
.field private displayName:Ljava/lang/String;

.field private displayNameChanged:Ljava/lang/Boolean;

.field private photoUrl:Ljava/lang/String;

.field private photoUrlChanged:Ljava/lang/Boolean;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2067
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;"
        }
    .end annotation

    .line 2120
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;-><init>()V

    const/4 v1, 0x0

    .line 2121
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2122
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->setDisplayName(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 2123
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2124
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->setPhotoUrl(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 2125
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2126
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->setDisplayNameChanged(Ljava/lang/Boolean;)V

    const/4 v1, 0x3

    .line 2127
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 2128
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->setPhotoUrlChanged(Ljava/lang/Boolean;)V

    return-object v0
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 2023
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayNameChanged()Ljava/lang/Boolean;
    .locals 1

    .line 2043
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayNameChanged:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPhotoUrl()Ljava/lang/String;
    .locals 1

    .line 2033
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoUrlChanged()Ljava/lang/Boolean;
    .locals 1

    .line 2056
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrlChanged:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 2027
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setDisplayNameChanged(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2050
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayNameChanged:Ljava/lang/Boolean;

    return-void

    .line 2048
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"displayNameChanged\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPhotoUrl(Ljava/lang/String;)V
    .locals 0

    .line 2037
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrl:Ljava/lang/String;

    return-void
.end method

.method public setPhotoUrlChanged(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2063
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrlChanged:Ljava/lang/Boolean;

    return-void

    .line 2061
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"photoUrlChanged\" is null."

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

    .line 2111
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2112
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2113
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2114
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->displayNameChanged:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2115
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonUserProfile;->photoUrlChanged:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
