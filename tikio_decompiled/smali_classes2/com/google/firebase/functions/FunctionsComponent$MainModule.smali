.class public interface abstract Lcom/google/firebase/functions/FunctionsComponent$MainModule;
.super Ljava/lang/Object;
.source "FunctionsComponent.java"


# annotations
.annotation runtime Lcom/google/firebase/functions/dagger/Module;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/functions/FunctionsComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MainModule"
.end annotation


# virtual methods
.method public abstract contextProvider(Lcom/google/firebase/functions/FirebaseContextProvider;)Lcom/google/firebase/functions/ContextProvider;
    .annotation runtime Lcom/google/firebase/functions/dagger/Binds;
    .end annotation
.end method
