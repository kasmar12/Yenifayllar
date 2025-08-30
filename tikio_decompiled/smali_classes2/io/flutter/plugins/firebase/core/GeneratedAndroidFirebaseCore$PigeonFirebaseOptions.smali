.class public final Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonFirebaseOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions$Builder;
    }
.end annotation


# instance fields
.field private androidClientId:Ljava/lang/String;

.field private apiKey:Ljava/lang/String;

.field private appGroupId:Ljava/lang/String;

.field private appId:Ljava/lang/String;

.field private authDomain:Ljava/lang/String;

.field private databaseURL:Ljava/lang/String;

.field private deepLinkURLScheme:Ljava/lang/String;

.field private iosBundleId:Ljava/lang/String;

.field private iosClientId:Ljava/lang/String;

.field private measurementId:Ljava/lang/String;

.field private messagingSenderId:Ljava/lang/String;

.field private projectId:Ljava/lang/String;

.field private storageBucket:Ljava/lang/String;

.field private trackingId:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;"
        }
    .end annotation

    .line 357
    new-instance v0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;-><init>()V

    const/4 v1, 0x0

    .line 358
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 359
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setApiKey(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 360
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 361
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setAppId(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 362
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 363
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setMessagingSenderId(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 364
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 365
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setProjectId(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 366
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 367
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setAuthDomain(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 368
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 369
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setDatabaseURL(Ljava/lang/String;)V

    const/4 v1, 0x6

    .line 370
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 371
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setStorageBucket(Ljava/lang/String;)V

    const/4 v1, 0x7

    .line 372
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 373
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setMeasurementId(Ljava/lang/String;)V

    const/16 v1, 0x8

    .line 374
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 375
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setTrackingId(Ljava/lang/String;)V

    const/16 v1, 0x9

    .line 376
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 377
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setDeepLinkURLScheme(Ljava/lang/String;)V

    const/16 v1, 0xa

    .line 378
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 379
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setAndroidClientId(Ljava/lang/String;)V

    const/16 v1, 0xb

    .line 380
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 381
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setIosClientId(Ljava/lang/String;)V

    const/16 v1, 0xc

    .line 382
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 383
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setIosBundleId(Ljava/lang/String;)V

    const/16 v1, 0xd

    .line 384
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 385
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->setAppGroupId(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getAndroidClientId()Ljava/lang/String;
    .locals 1

    .line 176
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->androidClientId:Ljava/lang/String;

    return-object v0
.end method

.method public getApiKey()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->apiKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAppGroupId()Ljava/lang/String;
    .locals 1

    .line 206
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appId:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthDomain()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->authDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabaseURL()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->databaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDeepLinkURLScheme()Ljava/lang/String;
    .locals 1

    .line 166
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->deepLinkURLScheme:Ljava/lang/String;

    return-object v0
.end method

.method public getIosBundleId()Ljava/lang/String;
    .locals 1

    .line 196
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosBundleId:Ljava/lang/String;

    return-object v0
.end method

.method public getIosClientId()Ljava/lang/String;
    .locals 1

    .line 186
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosClientId:Ljava/lang/String;

    return-object v0
.end method

.method public getMeasurementId()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->measurementId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessagingSenderId()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->messagingSenderId:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectId()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->projectId:Ljava/lang/String;

    return-object v0
.end method

.method public getStorageBucket()Ljava/lang/String;
    .locals 1

    .line 136
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->storageBucket:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 1

    .line 156
    iget-object v0, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->trackingId:Ljava/lang/String;

    return-object v0
.end method

.method public setAndroidClientId(Ljava/lang/String;)V
    .locals 0

    .line 180
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->androidClientId:Ljava/lang/String;

    return-void
.end method

.method public setApiKey(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 71
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->apiKey:Ljava/lang/String;

    return-void

    .line 69
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"apiKey\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAppGroupId(Ljava/lang/String;)V
    .locals 0

    .line 210
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appGroupId:Ljava/lang/String;

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 84
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appId:Ljava/lang/String;

    return-void

    .line 82
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"appId\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAuthDomain(Ljava/lang/String;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->authDomain:Ljava/lang/String;

    return-void
.end method

.method public setDatabaseURL(Ljava/lang/String;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->databaseURL:Ljava/lang/String;

    return-void
.end method

.method public setDeepLinkURLScheme(Ljava/lang/String;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->deepLinkURLScheme:Ljava/lang/String;

    return-void
.end method

.method public setIosBundleId(Ljava/lang/String;)V
    .locals 0

    .line 200
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosBundleId:Ljava/lang/String;

    return-void
.end method

.method public setIosClientId(Ljava/lang/String;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosClientId:Ljava/lang/String;

    return-void
.end method

.method public setMeasurementId(Ljava/lang/String;)V
    .locals 0

    .line 150
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->measurementId:Ljava/lang/String;

    return-void
.end method

.method public setMessagingSenderId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 97
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->messagingSenderId:Ljava/lang/String;

    return-void

    .line 95
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"messagingSenderId\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setProjectId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 110
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->projectId:Ljava/lang/String;

    return-void

    .line 108
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"projectId\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setStorageBucket(Ljava/lang/String;)V
    .locals 0

    .line 140
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->storageBucket:Ljava/lang/String;

    return-void
.end method

.method public setTrackingId(Ljava/lang/String;)V
    .locals 0

    .line 160
    iput-object p1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->trackingId:Ljava/lang/String;

    return-void
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

    .line 338
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 339
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->apiKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 341
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->messagingSenderId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 342
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->projectId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->authDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->databaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 345
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->storageBucket:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->measurementId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 347
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->trackingId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->deepLinkURLScheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 349
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->androidClientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 350
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosClientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->iosBundleId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    iget-object v1, p0, Lio/flutter/plugins/firebase/core/GeneratedAndroidFirebaseCore$PigeonFirebaseOptions;->appGroupId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
