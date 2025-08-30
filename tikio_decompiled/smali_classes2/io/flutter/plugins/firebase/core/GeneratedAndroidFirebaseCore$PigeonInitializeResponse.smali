.class public final Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonInitializeResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse$Builder;
    }
.end annotation


# instance fields
.field private isAutomaticDataCollectionEnabled:Ljava/lang/Boolean;

.field private name:Ljava/lang/String;

.field private options:Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

.field private pluginConstants:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 442
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;"
        }
    .end annotation

    .line 495
    new-instance v0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;-><init>()V

    const/4 v1, 0x0

    .line 496
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 497
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->setName(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 498
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 500
    :cond_0
    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

    move-result-object v1

    .line 499
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->setOptions(Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;)V

    const/4 v1, 0x2

    .line 501
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 502
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->setIsAutomaticDataCollectionEnabled(Ljava/lang/Boolean;)V

    const/4 v1, 0x3

    .line 503
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 504
    check-cast p0, Ljava/util/Map;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->setPluginConstants(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public getIsAutomaticDataCollectionEnabled()Ljava/lang/Boolean;
    .locals 1

    .line 421
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->isAutomaticDataCollectionEnabled:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 395
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;
    .locals 1

    .line 408
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->options:Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

    return-object v0
.end method

.method public getPluginConstants()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 431
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->pluginConstants:Ljava/util/Map;

    return-object v0
.end method

.method public setIsAutomaticDataCollectionEnabled(Ljava/lang/Boolean;)V
    .locals 0

    .line 425
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->isAutomaticDataCollectionEnabled:Ljava/lang/Boolean;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 402
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->name:Ljava/lang/String;

    return-void

    .line 400
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"name\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOptions(Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 415
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->options:Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

    return-void

    .line 413
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"options\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPluginConstants(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 438
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->pluginConstants:Ljava/util/Map;

    return-void

    .line 436
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"pluginConstants\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 486
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 487
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->options:Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->toList()Ljava/util/ArrayList;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->isAutomaticDataCollectionEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 490
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonInitializeResponse;->pluginConstants:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
