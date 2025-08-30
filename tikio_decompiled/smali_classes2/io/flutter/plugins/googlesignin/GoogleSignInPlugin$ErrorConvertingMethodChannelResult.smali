.class abstract Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;
.super Ljava/lang/Object;
.source "GoogleSignInPlugin.java"

# interfaces
.implements Lio/flutter/plugins/googlesignin/Messages$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/GoogleSignInPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ErrorConvertingMethodChannelResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/flutter/plugins/googlesignin/Messages$Result<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final result:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Throwable;)V
    .locals 3

    .line 275
    instance-of v0, p1, Lio/flutter/plugins/googlesignin/Messages$FlutterError;

    if-eqz v0, :cond_0

    .line 276
    check-cast p1, Lio/flutter/plugins/googlesignin/Messages$FlutterError;

    .line 277
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    iget-object v1, p1, Lio/flutter/plugins/googlesignin/Messages$FlutterError;->code:Ljava/lang/String;

    invoke-virtual {p1}, Lio/flutter/plugins/googlesignin/Messages$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object v2

    iget-object p1, p1, Lio/flutter/plugins/googlesignin/Messages$FlutterError;->details:Ljava/lang/Object;

    invoke-interface {v0, v1, v2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 279
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    const-string v2, "exception"

    invoke-interface {v0, v2, p1, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
