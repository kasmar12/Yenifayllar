.class public final Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonFirebaseAuthSettings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings$Builder;
    }
.end annotation


# instance fields
.field private appVerificationDisabledForTesting:Ljava/lang/Boolean;

.field private forceRecaptchaFlow:Ljava/lang/Boolean;

.field private phoneNumber:Ljava/lang/String;

.field private smsCode:Ljava/lang/String;

.field private userAccessGroup:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1503
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;"
        }
    .end annotation

    .line 1565
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;-><init>()V

    const/4 v1, 0x0

    .line 1566
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1567
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->setAppVerificationDisabledForTesting(Ljava/lang/Boolean;)V

    const/4 v1, 0x1

    .line 1569
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1570
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->setUserAccessGroup(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 1571
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1572
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->setPhoneNumber(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 1573
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1574
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->setSmsCode(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 1575
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 1576
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->setForceRecaptchaFlow(Ljava/lang/Boolean;)V

    return-object v0
.end method


# virtual methods
.method public getAppVerificationDisabledForTesting()Ljava/lang/Boolean;
    .locals 1

    .line 1451
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->appVerificationDisabledForTesting:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getForceRecaptchaFlow()Ljava/lang/Boolean;
    .locals 1

    .line 1495
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->forceRecaptchaFlow:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 1

    .line 1475
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getSmsCode()Ljava/lang/String;
    .locals 1

    .line 1485
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->smsCode:Ljava/lang/String;

    return-object v0
.end method

.method public getUserAccessGroup()Ljava/lang/String;
    .locals 1

    .line 1465
    iget-object v0, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->userAccessGroup:Ljava/lang/String;

    return-object v0
.end method

.method public setAppVerificationDisabledForTesting(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1459
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->appVerificationDisabledForTesting:Ljava/lang/Boolean;

    return-void

    .line 1456
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"appVerificationDisabledForTesting\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setForceRecaptchaFlow(Ljava/lang/Boolean;)V
    .locals 0

    .line 1499
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->forceRecaptchaFlow:Ljava/lang/Boolean;

    return-void
.end method

.method public setPhoneNumber(Ljava/lang/String;)V
    .locals 0

    .line 1479
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->phoneNumber:Ljava/lang/String;

    return-void
.end method

.method public setSmsCode(Ljava/lang/String;)V
    .locals 0

    .line 1489
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->smsCode:Ljava/lang/String;

    return-void
.end method

.method public setUserAccessGroup(Ljava/lang/String;)V
    .locals 0

    .line 1469
    iput-object p1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->userAccessGroup:Ljava/lang/String;

    return-void
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

    .line 1555
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1556
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->appVerificationDisabledForTesting:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1557
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->userAccessGroup:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1558
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1559
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->smsCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1560
    iget-object v1, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;->forceRecaptchaFlow:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
