.class public final synthetic Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    iput-object p2, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    iget-object v1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;->lambda$clearAuthCache$2$io-flutter-plugins-googlesignin-GoogleSignInPlugin$Delegate(Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
