.class public final Lcom/google/firebase/storage/ktx/StorageKt;
.super Ljava/lang/Object;
.source "Storage.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a!\u0010\u000f\u001a\u00020\u00102\u0017\u0010\u0011\u001a\u0013\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012\u00a2\u0006\u0002\u0008\u0015H\u0007\u001a\u0011\u0010\u0016\u001a\u00020\u0017*\u00060\u0018R\u00020\u0019H\u0087\u0002\u001a\u0013\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001a*\u00020\u001cH\u0087\u0002\u001a\u0011\u0010\u0016\u001a\u00020\u0017*\u00060\u001dR\u00020\u001eH\u0087\u0002\u001a\u0011\u0010\u0016\u001a\u00020\u0017*\u00060\u001fR\u00020 H\u0087\u0002\u001a\u0011\u0010!\u001a\u00020\u0017*\u00060\u0018R\u00020\u0019H\u0087\u0002\u001a\u0013\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001a*\u00020\u001cH\u0087\u0002\u001a\u0011\u0010!\u001a\u00020\u0017*\u00060\u001dR\u00020\u001eH\u0087\u0002\u001a\u0011\u0010!\u001a\u00020\u0017*\u00060\u001fR\u00020 H\u0087\u0002\u001a\u000f\u0010\"\u001a\u0004\u0018\u00010#*\u00020\u001cH\u0087\u0002\u001a\u0011\u0010\"\u001a\u00020$*\u00060\u001dR\u00020\u001eH\u0087\u0002\u001a\u0013\u0010\"\u001a\u0004\u0018\u00010\u0010*\u00060\u001fR\u00020 H\u0087\u0002\u001a\u0013\u0010%\u001a\u0004\u0018\u00010&*\u00060\u001fR\u00020 H\u0087\u0002\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\'\u001a\u00020(\u001a\u001a\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\'\u001a\u00020(2\u0006\u0010)\u001a\u00020#\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010)\u001a\u00020#\"\u0015\u0010\u0000\u001a\u00020\u0001*\u00020\u00028F\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0004\"D\u0010\u0005\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00080\u00070\u0006\"\u0012\u0008\u0000\u0010\u0008*\u000c0\tR\u0008\u0012\u0004\u0012\u0002H\u00080\n*\u0008\u0012\u0004\u0012\u0002H\u00080\n8FX\u0087\u0004\u00a2\u0006\u000c\u0012\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006*"
    }
    d2 = {
        "storage",
        "Lcom/google/firebase/storage/FirebaseStorage;",
        "Lcom/google/firebase/ktx/Firebase;",
        "getStorage",
        "(Lcom/google/firebase/ktx/Firebase;)Lcom/google/firebase/storage/FirebaseStorage;",
        "taskState",
        "Lkotlinx/coroutines/flow/Flow;",
        "Lcom/google/firebase/storage/ktx/TaskState;",
        "T",
        "Lcom/google/firebase/storage/StorageTask$SnapshotBase;",
        "Lcom/google/firebase/storage/StorageTask;",
        "getTaskState$annotations",
        "(Lcom/google/firebase/storage/StorageTask;)V",
        "getTaskState",
        "(Lcom/google/firebase/storage/StorageTask;)Lkotlinx/coroutines/flow/Flow;",
        "storageMetadata",
        "Lcom/google/firebase/storage/StorageMetadata;",
        "init",
        "Lkotlin/Function1;",
        "Lcom/google/firebase/storage/StorageMetadata$Builder;",
        "",
        "Lkotlin/ExtensionFunctionType;",
        "component1",
        "",
        "Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;",
        "Lcom/google/firebase/storage/FileDownloadTask;",
        "",
        "Lcom/google/firebase/storage/StorageReference;",
        "Lcom/google/firebase/storage/ListResult;",
        "Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;",
        "Lcom/google/firebase/storage/StreamDownloadTask;",
        "Lcom/google/firebase/storage/UploadTask$TaskSnapshot;",
        "Lcom/google/firebase/storage/UploadTask;",
        "component2",
        "component3",
        "",
        "Ljava/io/InputStream;",
        "component4",
        "Landroid/net/Uri;",
        "app",
        "Lcom/google/firebase/FirebaseApp;",
        "url",
        "com.google.firebase-firebase-storage"
    }
    k = 0x2
    mv = {
        0x1,
        0x7,
        0x1
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final component1(Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 238
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getBytesTransferred()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component1(Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 190
    invoke-virtual {p0}, Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;->getBytesTransferred()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component1(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getBytesTransferred()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component1(Lcom/google/firebase/storage/ListResult;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/ListResult;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/storage/StorageReference;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    invoke-virtual {p0}, Lcom/google/firebase/storage/ListResult;->getItems()Ljava/util/List;

    move-result-object p0

    const-string v0, "items"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final component2(Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 254
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component2(Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 206
    invoke-virtual {p0}, Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component2(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final component2(Lcom/google/firebase/storage/ListResult;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/ListResult;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/storage/StorageReference;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 286
    invoke-virtual {p0}, Lcom/google/firebase/storage/ListResult;->getPrefixes()Ljava/util/List;

    move-result-object p0

    const-string v0, "prefixes"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final component3(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)Lcom/google/firebase/storage/StorageMetadata;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getMetadata()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p0

    return-object p0
.end method

.method public static final component3(Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;)Ljava/io/InputStream;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 222
    invoke-virtual {p0}, Lcom/google/firebase/storage/StreamDownloadTask$TaskSnapshot;->getStream()Ljava/io/InputStream;

    move-result-object p0

    const-string v0, "stream"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final component3(Lcom/google/firebase/storage/ListResult;)Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 302
    invoke-virtual {p0}, Lcom/google/firebase/storage/ListResult;->getPageToken()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final component4(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)Landroid/net/Uri;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getUploadSessionUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static final getStorage(Lcom/google/firebase/ktx/Firebase;)Lcom/google/firebase/storage/FirebaseStorage;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    invoke-static {}, Lcom/google/firebase/storage/FirebaseStorage;->getInstance()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p0

    const-string v0, "getInstance()"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final getTaskState(Lcom/google/firebase/storage/StorageTask;)Lkotlinx/coroutines/flow/Flow;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/firebase/storage/StorageTask<",
            "TT;>.SnapshotBase;>(",
            "Lcom/google/firebase/storage/StorageTask<",
            "TT;>;)",
            "Lkotlinx/coroutines/flow/Flow<",
            "Lcom/google/firebase/storage/ktx/TaskState<",
            "TT;>;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 321
    new-instance v0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;-><init>(Lcom/google/firebase/storage/StorageTask;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->callbackFlow(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/flow/Flow;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getTaskState$annotations(Lcom/google/firebase/storage/StorageTask;)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    return-void
.end method

.method public static final storage(Lcom/google/firebase/ktx/Firebase;Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "app"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    invoke-static {p1}, Lcom/google/firebase/storage/FirebaseStorage;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p0

    const-string p1, "getInstance(app)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final storage(Lcom/google/firebase/ktx/Firebase;Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/storage/FirebaseStorage;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "app"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "url"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    invoke-static {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p0

    const-string p1, "getInstance(app, url)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final storage(Lcom/google/firebase/ktx/Firebase;Ljava/lang/String;)Lcom/google/firebase/storage/FirebaseStorage;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "url"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-static {p1}, Lcom/google/firebase/storage/FirebaseStorage;->getInstance(Ljava/lang/String;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p0

    const-string p1, "getInstance(url)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final storageMetadata(Lkotlin/jvm/functions/Function1;)Lcom/google/firebase/storage/StorageMetadata;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/google/firebase/storage/StorageMetadata$Builder;",
            "Lkotlin/Unit;",
            ">;)",
            "Lcom/google/firebase/storage/StorageMetadata;"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "init"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    new-instance v0, Lcom/google/firebase/storage/StorageMetadata$Builder;

    invoke-direct {v0}, Lcom/google/firebase/storage/StorageMetadata$Builder;-><init>()V

    .line 108
    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageMetadata$Builder;->build()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p0

    const-string v0, "builder.build()"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
