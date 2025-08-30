.class public final Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonStorageReference"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;
    }
.end annotation


# instance fields
.field private bucket:Ljava/lang/String;

.field private fullPath:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;"
        }
    .end annotation

    .line 259
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;-><init>()V

    const/4 v1, 0x0

    .line 260
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 261
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->setBucket(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 262
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 263
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->setFullPath(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 264
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 265
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->setName(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getBucket()Ljava/lang/String;
    .locals 1

    .line 178
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->bucket:Ljava/lang/String;

    return-object v0
.end method

.method public getFullPath()Ljava/lang/String;
    .locals 1

    .line 191
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->fullPath:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 204
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setBucket(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 185
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->bucket:Ljava/lang/String;

    return-void

    .line 183
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"bucket\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFullPath(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 198
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->fullPath:Ljava/lang/String;

    return-void

    .line 196
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"fullPath\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 211
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->name:Ljava/lang/String;

    return-void

    .line 209
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"name\" is null."

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

    .line 251
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 252
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->bucket:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->fullPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
