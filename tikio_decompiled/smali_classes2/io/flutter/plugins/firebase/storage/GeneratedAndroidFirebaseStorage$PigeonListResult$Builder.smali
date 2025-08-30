.class public final Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            ">;"
        }
    .end annotation
.end field

.field private pageToken:Ljava/lang/String;

.field private prefixs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 611
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;
    .locals 2

    .line 635
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;-><init>()V

    .line 636
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->items:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;->setItems(Ljava/util/List;)V

    .line 637
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->pageToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;->setPageToken(Ljava/lang/String;)V

    .line 638
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->prefixs:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;->setPrefixs(Ljava/util/List;)V

    return-object v0
.end method

.method public setItems(Ljava/util/List;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            ">;)",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;"
        }
    .end annotation

    .line 616
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->items:Ljava/util/List;

    return-object p0
.end method

.method public setPageToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;
    .locals 0

    .line 623
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->pageToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPrefixs(Ljava/util/List;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            ">;)",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;"
        }
    .end annotation

    .line 630
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->prefixs:Ljava/util/List;

    return-object p0
.end method
