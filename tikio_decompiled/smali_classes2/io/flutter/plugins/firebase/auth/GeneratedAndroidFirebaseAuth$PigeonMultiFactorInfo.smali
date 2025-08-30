.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonMultiFactorInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo$Builder;
    }
.end annotation


# instance fields
.field private displayName:Ljava/lang/String;

.field private enrollmentTimestamp:Ljava/lang/Double;

.field private factorId:Ljava/lang/String;

.field private phoneNumber:Ljava/lang/String;

.field private uid:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;"
        }
    .end annotation

    .line 326
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;-><init>()V

    const/4 v1, 0x0

    .line 327
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 328
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->setDisplayName(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 329
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 330
    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->setEnrollmentTimestamp(Ljava/lang/Double;)V

    const/4 v1, 0x2

    .line 331
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 332
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->setFactorId(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 333
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 334
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->setUid(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 335
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 336
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->setPhoneNumber(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 210
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEnrollmentTimestamp()Ljava/lang/Double;
    .locals 1

    .line 220
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->enrollmentTimestamp:Ljava/lang/Double;

    return-object v0
.end method

.method public getFactorId()Ljava/lang/String;
    .locals 1

    .line 233
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->factorId:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .line 256
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    .line 243
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setEnrollmentTimestamp(Ljava/lang/Double;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 227
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->enrollmentTimestamp:Ljava/lang/Double;

    return-void

    .line 225
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"enrollmentTimestamp\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFactorId(Ljava/lang/String;)V
    .locals 0

    .line 237
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->factorId:Ljava/lang/String;

    return-void
.end method

.method public setPhoneNumber(Ljava/lang/String;)V
    .locals 0

    .line 260
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->phoneNumber:Ljava/lang/String;

    return-void
.end method

.method public setUid(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 250
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->uid:Ljava/lang/String;

    return-void

    .line 248
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"uid\" is null."

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

    .line 316
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 317
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->enrollmentTimestamp:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->factorId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->uid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonMultiFactorInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
