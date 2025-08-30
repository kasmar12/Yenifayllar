.class public Lcom/google/firebase/functions/FunctionsRegistrar;
.super Ljava/lang/Object;
.source "FunctionsRegistrar.java"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-fn"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$getComponents$0(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/ComponentContainer;)Lcom/google/firebase/functions/FunctionsMultiResourceComponent;
    .locals 2

    .line 59
    invoke-static {}, Lcom/google/firebase/functions/DaggerFunctionsComponent;->builder()Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object v0

    const-class v1, Landroid/content/Context;

    .line 60
    invoke-interface {p2, v1}, Lcom/google/firebase/components/ComponentContainer;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setApplicationContext(Landroid/content/Context;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object v0

    const-class v1, Lcom/google/firebase/FirebaseOptions;

    .line 61
    invoke-interface {p2, v1}, Lcom/google/firebase/components/ComponentContainer;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/FirebaseOptions;

    invoke-interface {v0, v1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setFirebaseOptions(Lcom/google/firebase/FirebaseOptions;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object v0

    .line 62
    invoke-interface {p2, p0}, Lcom/google/firebase/components/ComponentContainer;->get(Lcom/google/firebase/components/Qualified;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setLiteExecutor(Ljava/util/concurrent/Executor;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object p0

    .line 63
    invoke-interface {p2, p1}, Lcom/google/firebase/components/ComponentContainer;->get(Lcom/google/firebase/components/Qualified;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    invoke-interface {p0, p1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setUiExecutor(Ljava/util/concurrent/Executor;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object p0

    const-class p1, Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 64
    invoke-interface {p2, p1}, Lcom/google/firebase/components/ComponentContainer;->getProvider(Ljava/lang/Class;)Lcom/google/firebase/inject/Provider;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setAuth(Lcom/google/firebase/inject/Provider;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object p0

    const-class p1, Lcom/google/firebase/iid/internal/FirebaseInstanceIdInternal;

    .line 65
    invoke-interface {p2, p1}, Lcom/google/firebase/components/ComponentContainer;->getProvider(Ljava/lang/Class;)Lcom/google/firebase/inject/Provider;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setIid(Lcom/google/firebase/inject/Provider;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object p0

    const-class p1, Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 66
    invoke-interface {p2, p1}, Lcom/google/firebase/components/ComponentContainer;->getDeferred(Ljava/lang/Class;)Lcom/google/firebase/inject/Deferred;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->setAppCheck(Lcom/google/firebase/inject/Deferred;)Lcom/google/firebase/functions/FunctionsComponent$Builder;

    move-result-object p0

    .line 67
    invoke-interface {p0}, Lcom/google/firebase/functions/FunctionsComponent$Builder;->build()Lcom/google/firebase/functions/FunctionsComponent;

    move-result-object p0

    .line 68
    invoke-interface {p0}, Lcom/google/firebase/functions/FunctionsComponent;->getMultiResourceComponent()Lcom/google/firebase/functions/FunctionsMultiResourceComponent;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/components/Component<",
            "*>;>;"
        }
    .end annotation

    .line 45
    const-class v0, Lcom/google/firebase/annotations/concurrent/Lightweight;

    const-class v1, Ljava/util/concurrent/Executor;

    invoke-static {v0, v1}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v0

    .line 46
    const-class v1, Lcom/google/firebase/annotations/concurrent/UiThread;

    const-class v2, Ljava/util/concurrent/Executor;

    invoke-static {v1, v2}, Lcom/google/firebase/components/Qualified;->qualified(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/firebase/components/Qualified;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/google/firebase/components/Component;

    .line 47
    const-class v3, Lcom/google/firebase/functions/FunctionsMultiResourceComponent;

    .line 48
    invoke-static {v3}, Lcom/google/firebase/components/Component;->builder(Ljava/lang/Class;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-string v4, "fire-fn"

    .line 49
    invoke-virtual {v3, v4}, Lcom/google/firebase/components/Component$Builder;->name(Ljava/lang/String;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-class v5, Landroid/content/Context;

    .line 50
    invoke-static {v5}, Lcom/google/firebase/components/Dependency;->required(Ljava/lang/Class;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-class v5, Lcom/google/firebase/FirebaseOptions;

    .line 51
    invoke-static {v5}, Lcom/google/firebase/components/Dependency;->required(Ljava/lang/Class;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-class v5, Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 52
    invoke-static {v5}, Lcom/google/firebase/components/Dependency;->optionalProvider(Ljava/lang/Class;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-class v5, Lcom/google/firebase/iid/internal/FirebaseInstanceIdInternal;

    .line 53
    invoke-static {v5}, Lcom/google/firebase/components/Dependency;->requiredProvider(Ljava/lang/Class;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    const-class v5, Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 54
    invoke-static {v5}, Lcom/google/firebase/components/Dependency;->deferred(Ljava/lang/Class;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    .line 55
    invoke-static {v0}, Lcom/google/firebase/components/Dependency;->required(Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    .line 56
    invoke-static {v1}, Lcom/google/firebase/components/Dependency;->required(Lcom/google/firebase/components/Qualified;)Lcom/google/firebase/components/Dependency;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->add(Lcom/google/firebase/components/Dependency;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v3

    new-instance v5, Lcom/google/firebase/functions/FunctionsRegistrar$$ExternalSyntheticLambda0;

    invoke-direct {v5, v0, v1}, Lcom/google/firebase/functions/FunctionsRegistrar$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;)V

    .line 57
    invoke-virtual {v3, v5}, Lcom/google/firebase/components/Component$Builder;->factory(Lcom/google/firebase/components/ComponentFactory;)Lcom/google/firebase/components/Component$Builder;

    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/google/firebase/components/Component$Builder;->build()Lcom/google/firebase/components/Component;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v2, v1

    const-string v0, "20.4.0"

    .line 70
    invoke-static {v4, v0}, Lcom/google/firebase/platforminfo/LibraryVersionComponent;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/components/Component;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v2, v1

    .line 47
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
