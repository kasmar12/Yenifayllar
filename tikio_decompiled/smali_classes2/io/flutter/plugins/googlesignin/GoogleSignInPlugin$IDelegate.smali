.class public interface abstract Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$IDelegate;
.super Ljava/lang/Object;
.source "GoogleSignInPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/GoogleSignInPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IDelegate"
.end annotation


# virtual methods
.method public abstract clearAuthCache(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;)V
.end method

.method public abstract disconnect(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end method

.method public abstract getTokens(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Z)V
.end method

.method public abstract init(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/MethodChannel$Result;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation
.end method

.method public abstract isSignedIn(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end method

.method public abstract requestScopes(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/MethodChannel$Result;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract signIn(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end method

.method public abstract signInSilently(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end method

.method public abstract signOut(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end method
