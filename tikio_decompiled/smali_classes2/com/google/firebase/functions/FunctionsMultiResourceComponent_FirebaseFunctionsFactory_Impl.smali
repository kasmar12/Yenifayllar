.class public final Lcom/google/firebase/functions/FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl;
.super Ljava/lang/Object;
.source "FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl.java"

# interfaces
.implements Lcom/google/firebase/functions/FunctionsMultiResourceComponent$FirebaseFunctionsFactory;


# instance fields
.field private final delegateFactory:Lcom/google/firebase/functions/FirebaseFunctions_Factory;


# direct methods
.method constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions_Factory;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/google/firebase/functions/FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl;->delegateFactory:Lcom/google/firebase/functions/FirebaseFunctions_Factory;

    return-void
.end method

.method public static create(Lcom/google/firebase/functions/FirebaseFunctions_Factory;)Ljavax/inject/Provider;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/functions/FirebaseFunctions_Factory;",
            ")",
            "Ljavax/inject/Provider<",
            "Lcom/google/firebase/functions/FunctionsMultiResourceComponent$FirebaseFunctionsFactory;",
            ">;"
        }
    .end annotation

    .line 28
    new-instance v0, Lcom/google/firebase/functions/FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl;

    invoke-direct {v0, p0}, Lcom/google/firebase/functions/FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl;-><init>(Lcom/google/firebase/functions/FirebaseFunctions_Factory;)V

    invoke-static {v0}, Lcom/google/firebase/functions/dagger/internal/InstanceFactory;->create(Ljava/lang/Object;)Lcom/google/firebase/functions/dagger/internal/Factory;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public create(Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/google/firebase/functions/FunctionsMultiResourceComponent_FirebaseFunctionsFactory_Impl;->delegateFactory:Lcom/google/firebase/functions/FirebaseFunctions_Factory;

    invoke-virtual {v0, p1}, Lcom/google/firebase/functions/FirebaseFunctions_Factory;->get(Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p1

    return-object p1
.end method
