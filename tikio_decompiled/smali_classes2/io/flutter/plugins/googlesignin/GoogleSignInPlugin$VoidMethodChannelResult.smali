.class Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$VoidMethodChannelResult;
.super Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;
.source "GoogleSignInPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/GoogleSignInPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VoidMethodChannelResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 315
    invoke-direct {p0, p1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .line 313
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$VoidMethodChannelResult;->success(Ljava/lang/Void;)V

    return-void
.end method

.method public success(Ljava/lang/Void;)V
    .locals 1

    .line 320
    iget-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$VoidMethodChannelResult;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method
