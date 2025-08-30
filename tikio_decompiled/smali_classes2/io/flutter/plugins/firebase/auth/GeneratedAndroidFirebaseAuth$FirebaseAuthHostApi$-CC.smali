.class public final synthetic Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseAuth.java"


# direct methods
.method public static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 2506
    sget-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApiCodec;->INSTANCE:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2522
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2523
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2524
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    .line 2525
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$1;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2538
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->registerIdTokenListener(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$1(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2553
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2554
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2555
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    .line 2556
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$2;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$2;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2569
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->registerAuthStateListener(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$10(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2846
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2847
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2848
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2849
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 2850
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2851
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$11;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$11;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2864
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInWithEmailAndPassword(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$11(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2879
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2880
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2881
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2882
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 2883
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2884
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$12;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$12;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2897
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInWithEmailLink(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$12(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2912
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2913
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2914
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2915
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;

    .line 2916
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$13;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$13;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2929
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInWithProvider(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonSignInProvider;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$13(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2944
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2945
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2946
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    .line 2947
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$14;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$14;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2960
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signOut(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$14(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2975
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2976
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2977
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2978
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2979
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$15;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$15;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2992
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->fetchSignInMethodsForEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$15(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 3007
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3008
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3009
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3010
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 3012
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;

    .line 3013
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$16;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$16;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3026
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->sendPasswordResetEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$16(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 3041
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3042
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3043
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3044
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 3046
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;

    .line 3047
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$17;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$17;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3060
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->sendSignInLinkToEmail(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonActionCodeSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$17(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 3075
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3076
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3077
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3078
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 3079
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$18;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$18;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3092
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->setLanguageCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$18(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 3107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3108
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3109
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3110
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;

    .line 3111
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$19;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$19;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3124
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->setSettings(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonFirebaseAuthSettings;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$19(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 3139
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3140
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3141
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3142
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 3143
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$20;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$20;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3156
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->verifyPasswordResetCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$2(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2584
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2585
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2586
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2587
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 2588
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 2589
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$3;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$3;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 2605
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 2602
    :goto_0
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->useEmulator(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$20(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 3171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3172
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3173
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3175
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;

    .line 3176
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$21;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$21;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3189
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->verifyPhoneNumber(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$PigeonVerifyPhoneNumberRequest;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$21(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 3204
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3205
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 3206
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 3207
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 3208
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$22;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$22;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 3221
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->revokeTokenWithAuthorizationCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$3(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2621
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2622
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2623
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2624
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2625
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$4;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$4;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2638
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->applyActionCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$4(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2653
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2654
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2655
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2656
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2657
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$5;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$5;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2670
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->checkActionCode(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$5(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2685
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2686
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2687
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2688
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 2689
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2690
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$6;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$6;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2703
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->confirmPasswordReset(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$6(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 2718
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2719
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2720
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2721
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 2722
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2723
    new-instance v3, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$7;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$7;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2736
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->createUserWithEmailAndPassword(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$7(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 2

    .line 2751
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2752
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2753
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    .line 2754
    new-instance v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$8;

    invoke-direct {v1, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$8;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2767
    invoke-interface {p0, p1, v1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInAnonymously(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$8(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2782
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2783
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2784
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2785
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 2786
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$9;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$9;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2799
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInWithCredential(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/util/Map;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$9(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 2814
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2815
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 2816
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;

    const/4 v2, 0x1

    .line 2817
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 2818
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$10;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$10;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 2831
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;->signInWithCustomToken(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$AuthPigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$Result;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V
    .locals 4

    .line 2514
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2518
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.registerIdTokenListener"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 2520
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 2541
    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2545
    :goto_0
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2549
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.registerAuthStateListener"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_1

    .line 2551
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda11;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda11;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 2572
    :cond_1
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2576
    :goto_1
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2580
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.useEmulator"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_2

    .line 2582
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 2609
    :cond_2
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2613
    :goto_2
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2617
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.applyActionCode"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_3

    .line 2619
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 2641
    :cond_3
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2645
    :goto_3
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2649
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.checkActionCode"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_4

    .line 2651
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda7;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_4

    .line 2673
    :cond_4
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2677
    :goto_4
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2681
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.confirmPasswordReset"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_5

    .line 2683
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda8;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_5

    .line 2706
    :cond_5
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2710
    :goto_5
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2714
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.createUserWithEmailAndPassword"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_6

    .line 2716
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda9;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda9;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_6

    .line 2739
    :cond_6
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2743
    :goto_6
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2747
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInAnonymously"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_7

    .line 2749
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda10;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda10;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_7

    .line 2770
    :cond_7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2774
    :goto_7
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2778
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInWithCredential"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_8

    .line 2780
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda12;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda12;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_8

    .line 2802
    :cond_8
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2806
    :goto_8
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2810
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInWithCustomToken"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_9

    .line 2812
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda13;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda13;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_9

    .line 2834
    :cond_9
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2838
    :goto_9
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2842
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInWithEmailAndPassword"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_a

    .line 2844
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda14;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda14;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_a

    .line 2867
    :cond_a
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2871
    :goto_a
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2875
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInWithEmailLink"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_b

    .line 2877
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda15;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda15;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_b

    .line 2900
    :cond_b
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2904
    :goto_b
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2908
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signInWithProvider"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_c

    .line 2910
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda16;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda16;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_c

    .line 2932
    :cond_c
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2936
    :goto_c
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2940
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.signOut"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_d

    .line 2942
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda17;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda17;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_d

    .line 2963
    :cond_d
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2967
    :goto_d
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 2971
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.fetchSignInMethodsForEmail"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_e

    .line 2973
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda18;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda18;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_e

    .line 2995
    :cond_e
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 2999
    :goto_e
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3003
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.sendPasswordResetEmail"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_f

    .line 3005
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda19;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda19;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_f

    .line 3029
    :cond_f
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3033
    :goto_f
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3037
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.sendSignInLinkToEmail"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_10

    .line 3039
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda20;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda20;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_10

    .line 3063
    :cond_10
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3067
    :goto_10
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3071
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.setLanguageCode"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_11

    .line 3073
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda21;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda21;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_11

    .line 3095
    :cond_11
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3099
    :goto_11
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3103
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.setSettings"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_12

    .line 3105
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_12

    .line 3127
    :cond_12
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3131
    :goto_12
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3135
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.verifyPasswordResetCode"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_13

    .line 3137
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_13

    .line 3159
    :cond_13
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3163
    :goto_13
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3167
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.verifyPhoneNumber"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_14

    .line 3169
    new-instance v2, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_14

    .line 3192
    :cond_14
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 3196
    :goto_14
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 3200
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi.revokeTokenWithAuthorizationCode"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_15

    .line 3202
    new-instance p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda5;

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$FirebaseAuthHostApi;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_15

    .line 3224
    :cond_15
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_15
    return-void
.end method
