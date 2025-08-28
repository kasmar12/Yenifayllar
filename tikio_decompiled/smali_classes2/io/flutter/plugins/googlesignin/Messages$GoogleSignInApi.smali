.class public interface abstract Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApi;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GoogleSignInApi"
.end annotation


# virtual methods
.method public abstract clearAuthCache(Ljava/lang/String;Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract disconnect(Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract getAccessToken(Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract init(Lio/flutter/plugins/googlesignin/Messages$InitParams;)V
.end method

.method public abstract isSignedIn()Ljava/lang/Boolean;
.end method

.method public abstract requestScopes(Ljava/util/List;Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract signIn(Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Lio/flutter/plugins/googlesignin/Messages$UserData;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract signInSilently(Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Lio/flutter/plugins/googlesignin/Messages$UserData;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract signOut(Lio/flutter/plugins/googlesignin/Messages$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/googlesignin/Messages$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method
