.class public final Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cacheControl:Ljava/lang/String;

.field private contentDisposition:Ljava/lang/String;

.field private contentEncoding:Ljava/lang/String;

.field private contentLanguage:Ljava/lang/String;

.field private contentType:Ljava/lang/String;

.field private customMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;
    .locals 2

    .line 529
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;-><init>()V

    .line 530
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->cacheControl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setCacheControl(Ljava/lang/String;)V

    .line 531
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentDisposition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setContentDisposition(Ljava/lang/String;)V

    .line 532
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setContentEncoding(Ljava/lang/String;)V

    .line 533
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setContentLanguage(Ljava/lang/String;)V

    .line 534
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setContentType(Ljava/lang/String;)V

    .line 535
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->customMetadata:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->setCustomMetadata(Ljava/util/Map;)V

    return-object v0
.end method

.method public setCacheControl(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0

    .line 489
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->cacheControl:Ljava/lang/String;

    return-object p0
.end method

.method public setContentDisposition(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0

    .line 496
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentDisposition:Ljava/lang/String;

    return-object p0
.end method

.method public setContentEncoding(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0

    .line 503
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentEncoding:Ljava/lang/String;

    return-object p0
.end method

.method public setContentLanguage(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0

    .line 510
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentLanguage:Ljava/lang/String;

    return-object p0
.end method

.method public setContentType(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0

    .line 517
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->contentType:Ljava/lang/String;

    return-object p0
.end method

.method public setCustomMetadata(Ljava/util/Map;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;"
        }
    .end annotation

    .line 524
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata$Builder;->customMetadata:Ljava/util/Map;

    return-object p0
.end method
