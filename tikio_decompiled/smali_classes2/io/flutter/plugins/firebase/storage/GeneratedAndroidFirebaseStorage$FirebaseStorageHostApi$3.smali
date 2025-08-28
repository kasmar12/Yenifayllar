.class Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"

# interfaces
.implements Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$reply:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

.field final synthetic val$wrapped:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 921
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$wrapped:Ljava/util/ArrayList;

    iput-object p2, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$reply:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Throwable;)V
    .locals 1

    .line 928
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 929
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$reply:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .line 921
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->success(Ljava/lang/Void;)V

    return-void
.end method

.method public success(Ljava/lang/Void;)V
    .locals 2

    .line 923
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$wrapped:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 924
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$reply:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;->val$wrapped:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method
