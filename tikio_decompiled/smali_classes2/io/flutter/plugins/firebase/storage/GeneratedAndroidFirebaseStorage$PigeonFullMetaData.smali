.class public final Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonFullMetaData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;
    }
.end annotation


# instance fields
.field private metadata:Ljava/util/Map;
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
.method public constructor <init>()V
    .locals 0

    .line 271
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;"
        }
    .end annotation

    .line 306
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;-><init>()V

    const/4 v1, 0x0

    .line 307
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 308
    check-cast p0, Ljava/util/Map;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->setMetadata(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public getMetadata()Ljava/util/Map;
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

    .line 275
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->metadata:Ljava/util/Map;

    return-object v0
.end method

.method public setMetadata(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 279
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->metadata:Ljava/util/Map;

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

    .line 300
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 301
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->metadata:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
