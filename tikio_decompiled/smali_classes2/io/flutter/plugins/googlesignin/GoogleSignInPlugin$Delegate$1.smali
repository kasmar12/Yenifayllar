.class Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$1;
.super Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;
.source "GoogleSignInPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;->requestScopes(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;


# direct methods
.method constructor <init>(Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 674
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$1;->this$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    invoke-direct {p0, p2}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$ErrorConvertingMethodChannelResult;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 1

    .line 677
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$1;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .line 674
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$1;->success(Ljava/lang/Boolean;)V

    return-void
.end method
