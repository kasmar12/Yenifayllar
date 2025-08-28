.class public final synthetic Lcom/google/firebase/functions/FunctionsComponent$MainModule$-CC;
.super Ljava/lang/Object;
.source "FunctionsComponent.java"


# direct methods
.method public static bindProjectId(Lcom/google/firebase/FirebaseOptions;)Ljava/lang/String;
    .locals 0
    .annotation runtime Lcom/google/firebase/functions/dagger/Provides;
    .end annotation

    .annotation runtime Ljavax/inject/Named;
        value = "projectId"
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/google/firebase/FirebaseOptions;->getProjectId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
