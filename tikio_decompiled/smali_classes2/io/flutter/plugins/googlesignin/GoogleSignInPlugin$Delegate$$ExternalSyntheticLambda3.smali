.class public final synthetic Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

.field public final synthetic f$1:Lio/flutter/plugins/googlesignin/Messages$Result;

.field public final synthetic f$2:Ljava/lang/Boolean;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;Lio/flutter/plugins/googlesignin/Messages$Result;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    iput-object p2, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$1:Lio/flutter/plugins/googlesignin/Messages$Result;

    iput-object p3, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Boolean;

    iput-object p4, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run(Ljava/util/concurrent/Future;)V
    .locals 4

    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    iget-object v1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$1:Lio/flutter/plugins/googlesignin/Messages$Result;

    iget-object v2, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Boolean;

    iget-object v3, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda3;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, p1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;->lambda$getAccessToken$5$io-flutter-plugins-googlesignin-GoogleSignInPlugin$Delegate(Lio/flutter/plugins/googlesignin/Messages$Result;Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/concurrent/Future;)V

    return-void
.end method
