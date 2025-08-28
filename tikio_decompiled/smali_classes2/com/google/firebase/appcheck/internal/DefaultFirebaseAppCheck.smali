.class public Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;
.super Lcom/google/firebase/appcheck/FirebaseAppCheck;
.source "DefaultFirebaseAppCheck.java"


# static fields
.field private static final BUFFER_TIME_MILLIS:J = 0x493e0L


# instance fields
.field private final appCheckListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;",
            ">;"
        }
    .end annotation
.end field

.field private appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

.field private appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

.field private final appCheckTokenListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;",
            ">;"
        }
    .end annotation
.end field

.field private final backgroundExecutor:Ljava/util/concurrent/Executor;

.field private cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

.field private cachedTokenTask:Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation
.end field

.field private final clock:Lcom/google/firebase/appcheck/internal/util/Clock;

.field private final firebaseApp:Lcom/google/firebase/FirebaseApp;

.field private final heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;"
        }
    .end annotation
.end field

.field private final liteExecutor:Ljava/util/concurrent/Executor;

.field private final retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

.field private final tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

.field private final uiExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/inject/Provider;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")V"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Lcom/google/firebase/appcheck/FirebaseAppCheck;-><init>()V

    .line 73
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    .line 76
    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;

    .line 77
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 78
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    .line 79
    new-instance p2, Lcom/google/firebase/appcheck/internal/StorageHelper;

    .line 80
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getPersistenceKey()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Lcom/google/firebase/appcheck/internal/StorageHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    .line 81
    new-instance p2, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    .line 83
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1, p0, p4, p6}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;-><init>(Landroid/content/Context;Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    .line 87
    iput-object p3, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->uiExecutor:Ljava/util/concurrent/Executor;

    .line 88
    iput-object p4, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    .line 89
    iput-object p5, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->backgroundExecutor:Ljava/util/concurrent/Executor;

    .line 90
    invoke-direct {p0, p5}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredAppCheckTokenInBackground(Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 91
    new-instance p1, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;

    invoke-direct {p1}, Lcom/google/firebase/appcheck/internal/util/Clock$DefaultClock;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->clock:Lcom/google/firebase/appcheck/internal/util/Clock;

    return-void
.end method

.method private hasValidToken()Z
    .locals 5

    .line 319
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {v0}, Lcom/google/firebase/appcheck/AppCheckToken;->getExpireTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->clock:Lcom/google/firebase/appcheck/internal/util/Clock;

    invoke-interface {v2}, Lcom/google/firebase/appcheck/internal/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$getLimitedUseToken$3(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 227
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/appcheck/AppCheckToken;

    .line 229
    invoke-static {p0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 228
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    .line 234
    :cond_0
    new-instance v0, Lcom/google/firebase/FirebaseException;

    .line 237
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 238
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 235
    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 234
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$getToken$1(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 204
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/appcheck/AppCheckToken;

    .line 206
    invoke-static {p0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 205
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    .line 211
    :cond_0
    new-instance v0, Lcom/google/firebase/FirebaseException;

    .line 214
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 215
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p0

    .line 211
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method private retrieveStoredAppCheckTokenInBackground(Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 95
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 96
    new-instance v1, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 104
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method private updateStoredToken(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 2

    .line 312
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->backgroundExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda6;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/firebase/appcheck/AppCheckToken;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 313
    invoke-virtual {p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    .line 315
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->maybeScheduleTokenRefresh(Lcom/google/firebase/appcheck/AppCheckToken;)V

    return-void
.end method


# virtual methods
.method public addAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
    .locals 3

    .line 163
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 166
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    .line 165
    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    .line 168
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckToken;)V

    :cond_0
    return-void
.end method

.method public addAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
    .locals 3

    .line 142
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 145
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    .line 144
    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    .line 147
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 149
    invoke-static {v0}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object v0

    .line 148
    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckTokenResult;)V

    :cond_0
    return-void
.end method

.method fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 278
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 279
    invoke-interface {v0}, Lcom/google/firebase/appcheck/AppCheckProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->uiExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda4;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;)V

    .line 280
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getAppCheckToken(Z)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 245
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method getHeartbeatControllerProvider()Lcom/google/firebase/inject/Provider;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/heartbeatinfo/HeartBeatController;",
            ">;"
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->heartbeatControllerProvider:Lcom/google/firebase/inject/Provider;

    return-object v0
.end method

.method public getInstalledAppCheckProviderFactory()Lcom/google/firebase/appcheck/AppCheckProviderFactory;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    return-object v0
.end method

.method public getLimitedUseAppCheckToken()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckToken;",
            ">;"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez v0, :cond_0

    .line 267
    new-instance v0, Lcom/google/firebase/FirebaseException;

    const-string v1, "No AppCheckProvider installed."

    invoke-direct {v0, v1}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    .line 273
    :cond_0
    invoke-interface {v0}, Lcom/google/firebase/appcheck/AppCheckProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getLimitedUseToken()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckTokenResult;",
            ">;"
        }
    .end annotation

    .line 223
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->getLimitedUseAppCheckToken()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    sget-object v2, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda2;->INSTANCE:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda2;

    .line 224
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public getToken(Z)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/appcheck/AppCheckTokenResult;",
            ">;"
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->retrieveStoredTokenTask:Lcom/google/android/gms/tasks/Task;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;)V
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseApp;->isDataCollectionDefaultEnabled()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;Z)V

    return-void
.end method

.method public installAppCheckProviderFactory(Lcom/google/firebase/appcheck/AppCheckProviderFactory;Z)V
    .locals 1

    .line 115
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    .line 117
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->firebaseApp:Lcom/google/firebase/FirebaseApp;

    invoke-interface {p1, v0}, Lcom/google/firebase/appcheck/AppCheckProviderFactory;->create(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/AppCheckProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 118
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {p1, p2}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->setIsAutoRefreshEnabled(Z)V

    return-void
.end method

.method public synthetic lambda$fetchTokenFromProvider$5$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 283
    invoke-direct {p0, p1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->updateStoredToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    .line 284
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;

    .line 285
    invoke-interface {v1, p1}, Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckToken;)V

    goto :goto_0

    .line 288
    :cond_0
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object v0

    .line 289
    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;

    .line 290
    invoke-interface {v2, v0}, Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;->onAppCheckTokenChanged(Lcom/google/firebase/appcheck/AppCheckTokenResult;)V

    goto :goto_1

    .line 292
    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$getAppCheckToken$4$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 248
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 249
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 251
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez p1, :cond_1

    .line 252
    new-instance p1, Lcom/google/firebase/FirebaseException;

    const-string p2, "No AppCheckProvider installed."

    invoke-direct {p1, p2}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 254
    :cond_1
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    if-eqz p1, :cond_2

    .line 255
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 256
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 257
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 259
    :cond_3
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    return-object p1
.end method

.method public synthetic lambda$getToken$2$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(ZLcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 187
    invoke-direct {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->hasValidToken()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 188
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 189
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p1

    .line 188
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 191
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    if-nez p1, :cond_1

    .line 192
    new-instance p1, Lcom/google/firebase/FirebaseException;

    const-string p2, "No AppCheckProvider installed."

    invoke-direct {p1, p2}, Lcom/google/firebase/FirebaseException;-><init>(Ljava/lang/String;)V

    .line 193
    invoke-static {p1}, Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;->constructFromError(Lcom/google/firebase/FirebaseException;)Lcom/google/firebase/appcheck/internal/DefaultAppCheckTokenResult;

    move-result-object p1

    .line 192
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 196
    :cond_1
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    if-eqz p1, :cond_2

    .line 197
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 198
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 199
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->fetchTokenFromProvider()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    .line 201
    :cond_3
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedTokenTask:Lcom/google/android/gms/tasks/Task;

    iget-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->liteExecutor:Ljava/util/concurrent/Executor;

    sget-object v0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda3;->INSTANCE:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda3;

    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$retrieveStoredAppCheckTokenInBackground$0$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/StorageHelper;->retrieveAppCheckToken()Lcom/google/firebase/appcheck/AppCheckToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {p0, v0}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    :cond_0
    const/4 v0, 0x0

    .line 102
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic lambda$updateStoredToken$6$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/StorageHelper;->saveAppCheckToken(Lcom/google/firebase/appcheck/AppCheckToken;)V

    return-void
.end method

.method public removeAppCheckListener(Lcom/google/firebase/appcheck/FirebaseAppCheck$AppCheckListener;)V
    .locals 2

    .line 175
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 177
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 178
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 177
    invoke-virtual {p1, v0}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    return-void
.end method

.method public removeAppCheckTokenListener(Lcom/google/firebase/appcheck/interop/AppCheckTokenListener;)V
    .locals 2

    .line 155
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 157
    iget-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckTokenListenerList:Ljava/util/List;

    .line 158
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckListenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 157
    invoke-virtual {p1, v0}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->onListenerCountChanged(I)V

    return-void
.end method

.method public resetAppCheckState()V
    .locals 1

    const/4 v0, 0x0

    .line 134
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProviderFactory:Lcom/google/firebase/appcheck/AppCheckProviderFactory;

    .line 135
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->appCheckProvider:Lcom/google/firebase/appcheck/AppCheckProvider;

    .line 136
    iput-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    .line 137
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->storageHelper:Lcom/google/firebase/appcheck/internal/StorageHelper;

    invoke-virtual {v0}, Lcom/google/firebase/appcheck/internal/StorageHelper;->clearSharedPrefs()V

    return-void
.end method

.method setCachedToken(Lcom/google/firebase/appcheck/AppCheckToken;)V
    .locals 0

    .line 304
    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->cachedToken:Lcom/google/firebase/appcheck/AppCheckToken;

    return-void
.end method

.method public setTokenAutoRefreshEnabled(Z)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->tokenRefreshManager:Lcom/google/firebase/appcheck/internal/TokenRefreshManager;

    invoke-virtual {v0, p1}, Lcom/google/firebase/appcheck/internal/TokenRefreshManager;->setIsAutoRefreshEnabled(Z)V

    return-void
.end method
