.class public final Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private maxResults:Ljava/lang/Long;

.field private pageToken:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;
    .locals 2

    .line 368
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;-><init>()V

    .line 369
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;->maxResults:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->setMaxResults(Ljava/lang/Long;)V

    .line 370
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;->pageToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->setPageToken(Ljava/lang/String;)V

    return-object v0
.end method

.method public setMaxResults(Ljava/lang/Long;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;
    .locals 0

    .line 356
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;->maxResults:Ljava/lang/Long;

    return-object p0
.end method

.method public setPageToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;
    .locals 0

    .line 363
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions$Builder;->pageToken:Ljava/lang/String;

    return-object p0
.end method
