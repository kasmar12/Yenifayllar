.class public final synthetic Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$Delegate;->lambda$signOut$0$io-flutter-plugins-googlesignin-GoogleSignInPlugin$Delegate(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
