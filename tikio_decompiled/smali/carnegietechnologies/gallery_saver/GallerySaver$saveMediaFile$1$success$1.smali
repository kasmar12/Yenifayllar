.class final Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "GallerySaver.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/lang/Boolean;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "carnegietechnologies.gallery_saver.GallerySaver$saveMediaFile$1$success$1"
    f = "GallerySaver.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;


# direct methods
.method constructor <init>(Lcarnegietechnologies/gallery_saver/GallerySaver;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcarnegietechnologies/gallery_saver/GallerySaver;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;

    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-direct {p1, v0, p2}, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;-><init>(Lcarnegietechnologies/gallery_saver/GallerySaver;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlin/coroutines/Continuation;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 66
    iget v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->label:I

    if-nez v0, :cond_1

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 67
    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {p1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getMediaType$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Lcarnegietechnologies/gallery_saver/MediaType;

    move-result-object p1

    sget-object v0, Lcarnegietechnologies/gallery_saver/MediaType;->video:Lcarnegietechnologies/gallery_saver/MediaType;

    const-string v1, "getContentResolver(...)"

    if-ne p1, v0, :cond_0

    .line 68
    sget-object v2, Lcarnegietechnologies/gallery_saver/FileUtils;->INSTANCE:Lcarnegietechnologies/gallery_saver/FileUtils;

    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {p1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getActivity$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {p1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getFilePath$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;

    move-result-object v4

    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {p1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getAlbumName$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;

    move-result-object v5

    iget-object p1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {p1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getToDcim$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Z

    move-result v6

    const/4 v7, 0x0

    const/16 v8, 0x10

    const/4 v9, 0x0

    invoke-static/range {v2 .. v9}, Lcarnegietechnologies/gallery_saver/FileUtils;->insertVideo$default(Lcarnegietechnologies/gallery_saver/FileUtils;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;ZIILjava/lang/Object;)Z

    move-result p1

    goto :goto_0

    .line 70
    :cond_0
    sget-object p1, Lcarnegietechnologies/gallery_saver/FileUtils;->INSTANCE:Lcarnegietechnologies/gallery_saver/FileUtils;

    iget-object v0, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {v0}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getActivity$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {v1}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getFilePath$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {v2}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getAlbumName$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcarnegietechnologies/gallery_saver/GallerySaver$saveMediaFile$1$success$1;->this$0:Lcarnegietechnologies/gallery_saver/GallerySaver;

    invoke-static {v3}, Lcarnegietechnologies/gallery_saver/GallerySaver;->access$getToDcim$p(Lcarnegietechnologies/gallery_saver/GallerySaver;)Z

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lcarnegietechnologies/gallery_saver/FileUtils;->insertImage(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    :goto_0
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 66
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
