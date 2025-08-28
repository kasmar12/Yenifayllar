.class public final Ldev/fluttercommunity/plus/share/MethodCallHandler;
.super Ljava/lang/Object;
.source "MethodCallHandler.kt"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMethodCallHandler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MethodCallHandler.kt\ndev/fluttercommunity/plus/share/MethodCallHandler\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,85:1\n1#2:86\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0018\u0010\u000b\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\rH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Ldev/fluttercommunity/plus/share/MethodCallHandler;",
        "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;",
        "share",
        "Ldev/fluttercommunity/plus/share/Share;",
        "manager",
        "Ldev/fluttercommunity/plus/share/ShareSuccessManager;",
        "(Ldev/fluttercommunity/plus/share/Share;Ldev/fluttercommunity/plus/share/ShareSuccessManager;)V",
        "expectMapArguments",
        "",
        "call",
        "Lio/flutter/plugin/common/MethodCall;",
        "onMethodCall",
        "result",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "share_plus_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final manager:Ldev/fluttercommunity/plus/share/ShareSuccessManager;

.field private final share:Ldev/fluttercommunity/plus/share/Share;


# direct methods
.method public constructor <init>(Ldev/fluttercommunity/plus/share/Share;Ldev/fluttercommunity/plus/share/ShareSuccessManager;)V
    .locals 1

    const-string v0, "share"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "manager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->share:Ldev/fluttercommunity/plus/share/Share;

    .line 11
    iput-object p2, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->manager:Ldev/fluttercommunity/plus/share/ShareSuccessManager;

    return-void
.end method

.method private final expectMapArguments(Lio/flutter/plugin/common/MethodCall;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 82
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    instance-of p1, p1, Ljava/util/Map;

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Map arguments expected"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 12

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v1, "method"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "WithResult"

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x16

    if-lt v1, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 20
    :goto_0
    iget-object v3, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    const-string v11, "dev.fluttercommunity.plus/share/unavailable"

    const-string v6, "subject"

    const-string v7, "text"

    const-string v8, "null cannot be cast to non-null type kotlin.String"

    sparse-switch v5, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v2, "share"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "shareUri"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_1

    .line 22
    :cond_1
    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/share/MethodCallHandler;->expectMapArguments(Lio/flutter/plugin/common/MethodCall;)V

    .line 23
    iget-object v0, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->share:Ldev/fluttercommunity/plus/share/Share;

    const-string v3, "uri"

    .line 24
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/String;

    .line 23
    invoke-virtual {v0, p1, v4, v2}, Ldev/fluttercommunity/plus/share/Share;->share(Ljava/lang/String;Ljava/lang/String;Z)V

    if-nez v1, :cond_9

    .line 29
    invoke-interface {p2, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    :sswitch_2
    const-string v2, "shareFilesWithResult"

    .line 20
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto/16 :goto_1

    :sswitch_3
    const-string v2, "shareWithResult"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_1

    .line 33
    :cond_2
    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/share/MethodCallHandler;->expectMapArguments(Lio/flutter/plugin/common/MethodCall;)V

    if-eqz v1, :cond_3

    .line 34
    iget-object v2, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->manager:Ldev/fluttercommunity/plus/share/ShareSuccessManager;

    invoke-virtual {v2, p2}, Ldev/fluttercommunity/plus/share/ShareSuccessManager;->setCallback(Lio/flutter/plugin/common/MethodChannel$Result;)Z

    move-result v2

    if-nez v2, :cond_3

    return-void

    .line 37
    :cond_3
    iget-object v2, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->share:Ldev/fluttercommunity/plus/share/Share;

    .line 38
    invoke-virtual {p1, v7}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/String;

    .line 39
    invoke-virtual {p1, v6}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 37
    invoke-virtual {v2, v3, p1, v1}, Ldev/fluttercommunity/plus/share/Share;->share(Ljava/lang/String;Ljava/lang/String;Z)V

    if-nez v1, :cond_9

    if-eqz v0, :cond_4

    .line 45
    invoke-interface {p2, v11}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 47
    :cond_4
    invoke-interface {p2, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    :sswitch_4
    const-string v2, "shareFiles"

    .line 20
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto :goto_1

    .line 52
    :cond_5
    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/share/MethodCallHandler;->expectMapArguments(Lio/flutter/plugin/common/MethodCall;)V

    if-eqz v1, :cond_6

    .line 53
    iget-object v2, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->manager:Ldev/fluttercommunity/plus/share/ShareSuccessManager;

    invoke-virtual {v2, p2}, Ldev/fluttercommunity/plus/share/ShareSuccessManager;->setCallback(Lio/flutter/plugin/common/MethodChannel$Result;)Z

    move-result v2

    if-nez v2, :cond_6

    return-void

    .line 57
    :cond_6
    :try_start_0
    iget-object v5, p0, Ldev/fluttercommunity/plus/share/MethodCallHandler;->share:Ldev/fluttercommunity/plus/share/Share;

    const-string v2, "paths"

    .line 58
    invoke-virtual {p1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v2, Ljava/util/List;

    const-string v3, "mimeTypes"

    .line 59
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 60
    invoke-virtual {p1, v7}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/lang/String;

    .line 61
    invoke-virtual {p1, v6}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    move-object v9, p1

    check-cast v9, Ljava/lang/String;

    move-object v6, v2

    move-object v7, v3

    move v10, v1

    .line 57
    invoke-virtual/range {v5 .. v10}, Ldev/fluttercommunity/plus/share/Share;->shareFiles(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V

    if-nez v1, :cond_9

    if-eqz v0, :cond_7

    .line 67
    invoke-interface {p2, v11}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 69
    :cond_7
    invoke-interface {p2, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 73
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Share failed"

    invoke-interface {p2, v0, p1, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 76
    :cond_8
    :goto_1
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :cond_9
    :goto_2
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x6bf77228 -> :sswitch_4
        -0x5f0fa63e -> :sswitch_3
        -0x4842cb85 -> :sswitch_2
        -0x2c5502f3 -> :sswitch_1
        0x6854fdf -> :sswitch_0
    .end sparse-switch
.end method
