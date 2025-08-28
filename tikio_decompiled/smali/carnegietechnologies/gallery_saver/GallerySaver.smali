.class public final Lcarnegietechnologies/gallery_saver/GallerySaver;
.super Ljava/lang/Object;
.source "GallerySaver.kt"

# interfaces
.implements Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcarnegietechnologies/gallery_saver/GallerySaver$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0004\u0018\u0000 $2\u00020\u0001:\u0001$B\u000f\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J%\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000bH\u0000\u00a2\u0006\u0002\u0008\u0017J\u0008\u0010\u0018\u001a\u00020\u0013H\u0002J\u0008\u0010\u0019\u001a\u00020\u0013H\u0002J\u0008\u0010\u001a\u001a\u00020\u000fH\u0002J+\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u001d2\u000c\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u001f2\u0006\u0010 \u001a\u00020!H\u0016\u00a2\u0006\u0002\u0010\"J\u0008\u0010#\u001a\u00020\u0013H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lcarnegietechnologies/gallery_saver/GallerySaver;",
        "Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;",
        "activity",
        "Landroid/app/Activity;",
        "(Landroid/app/Activity;)V",
        "albumName",
        "",
        "filePath",
        "job",
        "Lkotlinx/coroutines/CompletableJob;",
        "mediaType",
        "Lcarnegietechnologies/gallery_saver/MediaType;",
        "pendingResult",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "toDcim",
        "",
        "uiScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "checkPermissionAndSaveFile",
        "",
        "methodCall",
        "Lio/flutter/plugin/common/MethodCall;",
        "result",
        "checkPermissionAndSaveFile$gallery_saver_release",
        "finishWithFailure",
        "finishWithSuccess",
        "isWritePermissionGranted",
        "onRequestPermissionsResult",
        "requestCode",
        "",
        "permissions",
        "",
        "grantResults",
        "",
        "(I[Ljava/lang/String;[I)Z",
        "saveMediaFile",
        "Companion",
        "gallery_saver_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcarnegietechnologies/gallery_saver/GallerySaver$Companion;

.field private static final KEY_ALBUM_NAME:Ljava/lang/String; = "albumName"

.field private static final KEY_PATH:Ljava/lang/String; = "path"

.field private static final KEY_TO_DCIM:Ljava/lang/String; = "toDcim"

.field private static final REQUEST_EXTERNAL_IMAGE_STORAGE_PERMISSION:I = 0x968


# instance fields
.field private final activity:Landroid/app/Activity;

.field private albumName:Ljava/lang/String;

.field private filePath:Ljava/lang/String;

.field private final job:Lkotlinx/coroutines/CompletableJob;

.field private mediaType:Lcarnegietechnologies/gallery_saver/MediaType;

.field private pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

.field private toDcim:Z

.field private final uiScope:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcarnegietechnologies/gallery_saver/GallerySaver$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcarnegietechnologies/gallery_saver/GallerySaver$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcarnegietechnologies/gallery_saver/GallerySaver;->Companion:Lcarnegietechnologies/gallery_saver/GallerySaver$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->activity:Landroid/app/Activity;

    const-string p1, ""

    .line 21
    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->filePath:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->albumName:Ljava/lang/String;

    const/4 p1, 0x0

    const/4 v0, 0x1

    .line 25
    invoke-static {p1, v0, p1}, Lkotlinx/coroutines/JobKt;->Job$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object p1

    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->job:Lkotlinx/coroutines/CompletableJob;

    .line 26
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v0

    check-cast p1, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v0, p1}, Lkotlinx/coroutines/MainCoroutineDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p1

    invoke-static {p1}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object p1

    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->uiScope:Lkotlinx/coroutines/CoroutineScope;

    return-void
.end method

.method public static final synthetic access$finishWithSuccess(Lcarnegietechnologies/gallery_saver/GallerySaver;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->finishWithSuccess()V

    return-void
.end method

.method public static final synthetic access$getActivity$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Landroid/app/Activity;
    .locals 0

    .line 16
    iget-object p0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method public static final synthetic access$getAlbumName$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;
    .locals 0

    .line 16
    iget-object p0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->albumName:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getFilePath$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;
    .locals 0

    .line 16
    iget-object p0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->filePath:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getMediaType$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Lcarnegietechnologies/gallery_saver/MediaType;
    .locals 0

    .line 16
    iget-object p0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->mediaType:Lcarnegietechnologies/gallery_saver/MediaType;

    return-object p0
.end method

.method public static final synthetic access$getToDcim$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Z
    .locals 0

    .line 16
    iget-boolean p0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->toDcim:Z

    return p0
.end method

.method private final finishWithFailure()V
    .locals 2

    .line 84
    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 85
    iput-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method

.method private final finishWithSuccess()V
    .locals 2

    .line 79
    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 80
    iput-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method

.method private final isWritePermissionGranted()Z
    .locals 2

    .line 60
    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->activity:Landroid/app/Activity;

    check-cast v0, Landroid/content/Context;

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 59
    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final saveMediaFile()V
    .locals 6

    .line 65
    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->uiScope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v1, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1;-><init>(Lcarnegietechnologies/gallery_saver/GallerySaver;Lkotlin/coroutines/Continuation;)V

    move-object v3, v1

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/4 v1, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method


# virtual methods
.method public final checkPermissionAndSaveFile$gallery_saver_release(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcarnegietechnologies/gallery_saver/MediaType;)V
    .locals 2

    const-string v0, "methodCall"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mediaType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    .line 40
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, ""

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    :cond_1
    iput-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->filePath:Ljava/lang/String;

    const-string v0, "albumName"

    .line 41
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    move-object v1, v0

    :cond_3
    :goto_0
    iput-object v1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->albumName:Ljava/lang/String;

    const-string v0, "toDcim"

    .line 42
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type kotlin.Boolean"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->toDcim:Z

    .line 43
    iput-object p3, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->mediaType:Lcarnegietechnologies/gallery_saver/MediaType;

    .line 44
    iput-object p2, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 46
    invoke-direct {p0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->isWritePermissionGranted()Z

    move-result p1

    if-nez p1, :cond_5

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1d

    if-lt p1, p2, :cond_4

    goto :goto_1

    .line 50
    :cond_4
    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver;->activity:Landroid/app/Activity;

    const-string p2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 51
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    const/16 p3, 0x968

    .line 49
    invoke-static {p1, p2, p3}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_2

    .line 47
    :cond_5
    :goto_1
    invoke-direct {p0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->saveMediaFile()V

    :goto_2
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)Z
    .locals 1

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "grantResults"

    invoke-static {p3, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x0

    const/16 v0, 0x968

    if-ne p1, v0, :cond_3

    .line 92
    array-length p1, p3

    const/4 v0, 0x1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    xor-int/2addr p1, v0

    if-eqz p1, :cond_1

    .line 93
    aget p1, p3, p2

    if-nez p1, :cond_1

    const/4 p2, 0x1

    :cond_1
    if-eqz p2, :cond_2

    .line 95
    invoke-direct {p0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->saveMediaFile()V

    goto :goto_1

    .line 97
    :cond_2
    invoke-direct {p0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->finishWithFailure()V

    :goto_1
    return v0

    :cond_3
    return p2
.end method
