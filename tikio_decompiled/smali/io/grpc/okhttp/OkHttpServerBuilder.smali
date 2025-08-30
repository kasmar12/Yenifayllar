.class public final Lio/grpc/okhttp/OkHttpServerBuilder;
.super Lio/grpc/ForwardingServerBuilder;
.source "OkHttpServerBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/okhttp/OkHttpServerBuilder$ClientCertRequestingSocketFactory;,
        Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/grpc/ForwardingServerBuilder<",
        "Lio/grpc/okhttp/OkHttpServerBuilder;",
        ">;"
    }
.end annotation


# static fields
.field private static final AS_LARGE_AS_INFINITE:J

.field private static final DEFAULT_FLOW_CONTROL_WINDOW:I = 0xffff

.field private static final DEFAULT_TRANSPORT_EXECUTOR_POOL:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field static final MAX_CONNECTION_AGE_GRACE_NANOS_INFINITE:J = 0x7fffffffffffffffL

.field static final MAX_CONNECTION_AGE_NANOS_DISABLED:J = 0x7fffffffffffffffL

.field static final MAX_CONNECTION_IDLE_NANOS_DISABLED:J = 0x7fffffffffffffffL

.field private static final MIN_MAX_CONNECTION_AGE_NANO:J

.field private static final MIN_MAX_CONNECTION_IDLE_NANO:J

.field private static final log:Ljava/util/logging/Logger;

.field private static final understoodTlsFeatures:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lio/grpc/TlsServerCredentials$Feature;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field flowControlWindow:I

.field final handshakerSocketFactory:Lio/grpc/okhttp/HandshakerSocketFactory;

.field keepAliveTimeNanos:J

.field keepAliveTimeoutNanos:J

.field final listenAddress:Ljava/net/SocketAddress;

.field maxConnectionAgeGraceInNanos:J

.field maxConnectionAgeInNanos:J

.field maxConnectionIdleInNanos:J

.field maxInboundMessageSize:I

.field maxInboundMetadataSize:I

.field permitKeepAliveTimeInNanos:J

.field permitKeepAliveWithoutCalls:Z

.field scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field final serverImplBuilder:Lio/grpc/internal/ServerImplBuilder;

.field socketFactory:Ljavax/net/ServerSocketFactory;

.field transportExecutorPool:Lio/grpc/internal/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/ObjectPool<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 71
    const-class v0, Lio/grpc/okhttp/OkHttpServerBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->log:Ljava/util/logging/Logger;

    .line 75
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v3

    sput-wide v3, Lio/grpc/okhttp/OkHttpServerBuilder;->MIN_MAX_CONNECTION_IDLE_NANO:J

    .line 78
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->MIN_MAX_CONNECTION_AGE_NANO:J

    .line 80
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->AS_LARGE_AS_INFINITE:J

    .line 81
    sget-object v0, Lio/grpc/okhttp/OkHttpChannelBuilder;->DEFAULT_TRANSPORT_EXECUTOR_POOL:Lio/grpc/internal/ObjectPool;

    sput-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->DEFAULT_TRANSPORT_EXECUTOR_POOL:Lio/grpc/internal/ObjectPool;

    .line 381
    sget-object v0, Lio/grpc/TlsServerCredentials$Feature;->MTLS:Lio/grpc/TlsServerCredentials$Feature;

    sget-object v1, Lio/grpc/TlsServerCredentials$Feature;->CUSTOM_MANAGERS:Lio/grpc/TlsServerCredentials$Feature;

    .line 382
    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->understoodTlsFeatures:Ljava/util/EnumSet;

    return-void
.end method

.method constructor <init>(Ljava/net/SocketAddress;Lio/grpc/okhttp/HandshakerSocketFactory;)V
    .locals 5

    .line 136
    invoke-direct {p0}, Lio/grpc/ForwardingServerBuilder;-><init>()V

    .line 113
    new-instance v0, Lio/grpc/internal/ServerImplBuilder;

    new-instance v1, Lio/grpc/okhttp/OkHttpServerBuilder$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lio/grpc/okhttp/OkHttpServerBuilder$$ExternalSyntheticLambda0;-><init>(Lio/grpc/okhttp/OkHttpServerBuilder;)V

    invoke-direct {v0, v1}, Lio/grpc/internal/ServerImplBuilder;-><init>(Lio/grpc/internal/ServerImplBuilder$ClientTransportServersBuilder;)V

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->serverImplBuilder:Lio/grpc/internal/ServerImplBuilder;

    .line 116
    invoke-static {}, Lio/grpc/internal/TransportTracer;->getDefaultFactory()Lio/grpc/internal/TransportTracer$Factory;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;

    .line 118
    sget-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->DEFAULT_TRANSPORT_EXECUTOR_POOL:Lio/grpc/internal/ObjectPool;

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->transportExecutorPool:Lio/grpc/internal/ObjectPool;

    .line 119
    sget-object v0, Lio/grpc/internal/GrpcUtil;->TIMER_SERVICE:Lio/grpc/internal/SharedResourceHolder$Resource;

    .line 120
    invoke-static {v0}, Lio/grpc/internal/SharedResourcePool;->forResource(Lio/grpc/internal/SharedResourceHolder$Resource;)Lio/grpc/internal/SharedResourcePool;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;

    .line 122
    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->socketFactory:Ljavax/net/ServerSocketFactory;

    .line 123
    sget-wide v0, Lio/grpc/internal/GrpcUtil;->DEFAULT_SERVER_KEEPALIVE_TIME_NANOS:J

    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeNanos:J

    .line 124
    sget-wide v0, Lio/grpc/internal/GrpcUtil;->DEFAULT_SERVER_KEEPALIVE_TIMEOUT_NANOS:J

    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeoutNanos:J

    const v0, 0xffff

    .line 125
    iput v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->flowControlWindow:I

    const/16 v0, 0x2000

    .line 126
    iput v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMetadataSize:I

    const/high16 v0, 0x400000

    .line 127
    iput v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMessageSize:I

    const-wide v0, 0x7fffffffffffffffL

    .line 128
    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    .line 130
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x5

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    iput-wide v2, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveTimeInNanos:J

    .line 131
    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeInNanos:J

    .line 132
    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeGraceInNanos:J

    const-string v0, "address"

    .line 137
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/SocketAddress;

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->listenAddress:Ljava/net/SocketAddress;

    const-string p1, "handshakerSocketFactory"

    .line 139
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/okhttp/HandshakerSocketFactory;

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->handshakerSocketFactory:Lio/grpc/okhttp/HandshakerSocketFactory;

    return-void
.end method

.method public static forPort(I)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 92
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public static forPort(ILio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 1

    .line 99
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, p0}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-static {v0, p1}, Lio/grpc/okhttp/OkHttpServerBuilder;->forPort(Ljava/net/SocketAddress;Lio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static forPort(Ljava/net/SocketAddress;Lio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 1

    .line 106
    invoke-static {p1}, Lio/grpc/okhttp/OkHttpServerBuilder;->handshakerSocketFactoryFrom(Lio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p1

    .line 107
    iget-object v0, p1, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lio/grpc/okhttp/OkHttpServerBuilder;

    iget-object p1, p1, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->factory:Lio/grpc/okhttp/HandshakerSocketFactory;

    invoke-direct {v0, p0, p1}, Lio/grpc/okhttp/OkHttpServerBuilder;-><init>(Ljava/net/SocketAddress;Lio/grpc/okhttp/HandshakerSocketFactory;)V

    return-object v0

    .line 108
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    iget-object p1, p1, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error:Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static handshakerSocketFactoryFrom(Lio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;
    .locals 7

    .line 386
    instance-of v0, p0, Lio/grpc/TlsServerCredentials;

    const/4 v1, 0x2

    if-eqz v0, :cond_9

    .line 387
    check-cast p0, Lio/grpc/TlsServerCredentials;

    .line 388
    sget-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->understoodTlsFeatures:Ljava/util/EnumSet;

    .line 389
    invoke-virtual {p0, v0}, Lio/grpc/TlsServerCredentials;->incomprehensible(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 390
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 391
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TLS features not understood: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 395
    :cond_0
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getKeyManagers()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    .line 396
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getKeyManagers()Ljava/util/List;

    move-result-object v0

    new-array v4, v2, [Ljavax/net/ssl/KeyManager;

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljavax/net/ssl/KeyManager;

    goto :goto_0

    .line 397
    :cond_1
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getPrivateKey()[B

    move-result-object v0

    if-eqz v0, :cond_3

    .line 398
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getPrivateKeyPassword()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string p0, "byte[]-based private key with password unsupported. Use unencrypted file or KeyManager"

    .line 399
    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 404
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getCertificateChain()[B

    move-result-object v0

    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getPrivateKey()[B

    move-result-object v4

    .line 403
    invoke-static {v0, v4}, Lio/grpc/okhttp/OkHttpChannelBuilder;->createKeyManager([B[B)[Ljavax/net/ssl/KeyManager;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 406
    sget-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->log:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Exception loading private key from credential"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 407
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to load private key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    invoke-virtual {p0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 407
    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    :cond_3
    move-object v0, v3

    .line 412
    :goto_0
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getTrustManagers()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 413
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getTrustManagers()Ljava/util/List;

    move-result-object v4

    new-array v5, v2, [Ljavax/net/ssl/TrustManager;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljavax/net/ssl/TrustManager;

    goto :goto_1

    .line 414
    :cond_4
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getRootCertificates()[B

    move-result-object v4

    if-eqz v4, :cond_5

    .line 416
    :try_start_1
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getRootCertificates()[B

    move-result-object v4

    invoke-static {v4}, Lio/grpc/okhttp/OkHttpChannelBuilder;->createTrustManager([B)[Ljavax/net/ssl/TrustManager;

    move-result-object v4
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    .line 418
    sget-object v0, Lio/grpc/okhttp/OkHttpServerBuilder;->log:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Exception loading root certificates from credential"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to load root certificates: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    invoke-virtual {p0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 419
    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    :cond_5
    move-object v4, v3

    :goto_1
    :try_start_2
    const-string v5, "TLS"

    .line 425
    invoke-static {}, Lio/grpc/okhttp/internal/Platform;->get()Lio/grpc/okhttp/internal/Platform;

    move-result-object v6

    invoke-virtual {v6}, Lio/grpc/okhttp/internal/Platform;->getProvider()Ljava/security/Provider;

    move-result-object v6

    invoke-static {v5, v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/net/ssl/SSLContext;

    move-result-object v5

    .line 426
    invoke-virtual {v5, v0, v4, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 430
    invoke-virtual {v5}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 431
    sget-object v3, Lio/grpc/okhttp/OkHttpServerBuilder$1;->$SwitchMap$io$grpc$TlsServerCredentials$ClientAuth:[I

    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getClientAuth()Lio/grpc/TlsServerCredentials$ClientAuth;

    move-result-object v4

    invoke-virtual {v4}, Lio/grpc/TlsServerCredentials$ClientAuth;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_7

    if-eq v3, v1, :cond_6

    const/4 v1, 0x3

    if-eq v3, v1, :cond_8

    .line 445
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown TlsServerCredentials.ClientAuth value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    invoke-virtual {p0}, Lio/grpc/TlsServerCredentials;->getClientAuth()Lio/grpc/TlsServerCredentials$ClientAuth;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 445
    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 437
    :cond_6
    new-instance p0, Lio/grpc/okhttp/OkHttpServerBuilder$ClientCertRequestingSocketFactory;

    invoke-direct {p0, v0, v4}, Lio/grpc/okhttp/OkHttpServerBuilder$ClientCertRequestingSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Z)V

    goto :goto_2

    .line 433
    :cond_7
    new-instance p0, Lio/grpc/okhttp/OkHttpServerBuilder$ClientCertRequestingSocketFactory;

    invoke-direct {p0, v0, v2}, Lio/grpc/okhttp/OkHttpServerBuilder$ClientCertRequestingSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Z)V

    :goto_2
    move-object v0, p0

    .line 448
    :cond_8
    new-instance p0, Lio/grpc/okhttp/TlsServerHandshakerSocketFactory;

    new-instance v1, Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;

    invoke-direct {v1, v0}, Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-direct {p0, v1}, Lio/grpc/okhttp/TlsServerHandshakerSocketFactory;-><init>(Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;)V

    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->factory(Lio/grpc/okhttp/HandshakerSocketFactory;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    :catch_2
    move-exception p0

    .line 428
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "TLS Provider failure"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 451
    :cond_9
    instance-of v0, p0, Lio/grpc/InsecureServerCredentials;

    if-eqz v0, :cond_a

    .line 452
    new-instance p0, Lio/grpc/okhttp/PlaintextHandshakerSocketFactory;

    invoke-direct {p0}, Lio/grpc/okhttp/PlaintextHandshakerSocketFactory;-><init>()V

    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->factory(Lio/grpc/okhttp/HandshakerSocketFactory;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 454
    :cond_a
    instance-of v0, p0, Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;

    if-eqz v0, :cond_b

    .line 455
    check-cast p0, Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;

    .line 457
    new-instance v0, Lio/grpc/okhttp/TlsServerHandshakerSocketFactory;

    invoke-direct {v0, p0}, Lio/grpc/okhttp/TlsServerHandshakerSocketFactory;-><init>(Lio/grpc/okhttp/SslSocketFactoryServerCredentials$ServerCredentials;)V

    invoke-static {v0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->factory(Lio/grpc/okhttp/HandshakerSocketFactory;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 460
    :cond_b
    instance-of v0, p0, Lio/grpc/ChoiceServerCredentials;

    if-eqz v0, :cond_e

    .line 461
    check-cast p0, Lio/grpc/ChoiceServerCredentials;

    .line 462
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 463
    invoke-virtual {p0}, Lio/grpc/ChoiceServerCredentials;->getCredentialsList()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/ServerCredentials;

    .line 464
    invoke-static {v2}, Lio/grpc/okhttp/OkHttpServerBuilder;->handshakerSocketFactoryFrom(Lio/grpc/ServerCredentials;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object v2

    .line 465
    iget-object v3, v2, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error:Ljava/lang/String;

    if-nez v3, :cond_c

    return-object v2

    :cond_c
    const-string v3, ", "

    .line 468
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    iget-object v2, v2, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 471
    :cond_d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0

    .line 474
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported credential type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 474
    invoke-static {p0}, Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;->error(Ljava/lang/String;)Lio/grpc/okhttp/OkHttpServerBuilder$HandshakerSocketFactoryResult;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method buildTransportServers(Ljava/util/List;)Lio/grpc/internal/InternalServer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ">;)",
            "Lio/grpc/internal/InternalServer;"
        }
    .end annotation

    .line 378
    new-instance v0, Lio/grpc/okhttp/OkHttpServer;

    iget-object v1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->serverImplBuilder:Lio/grpc/internal/ServerImplBuilder;

    invoke-virtual {v1}, Lio/grpc/internal/ServerImplBuilder;->getChannelz()Lio/grpc/InternalChannelz;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lio/grpc/okhttp/OkHttpServer;-><init>(Lio/grpc/okhttp/OkHttpServerBuilder;Ljava/util/List;Lio/grpc/InternalChannelz;)V

    return-object v0
.end method

.method protected delegate()Lio/grpc/ServerBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/ServerBuilder<",
            "*>;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->serverImplBuilder:Lio/grpc/internal/ServerImplBuilder;

    return-object v0
.end method

.method public flowControlWindow(I)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 2

    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "flowControlWindow must be positive"

    .line 317
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 318
    iput p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->flowControlWindow:I

    return-object p0
.end method

.method public bridge synthetic keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "keepalive time must be positive"

    .line 191
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 192
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeNanos:J

    .line 193
    invoke-static {p1, p2}, Lio/grpc/internal/KeepAliveManager;->clampKeepAliveTimeInNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeNanos:J

    .line 194
    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->AS_LARGE_AS_INFINITE:J

    cmp-long p3, p1, v0

    if-ltz p3, :cond_1

    const-wide p1, 0x7fffffffffffffffL

    .line 196
    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeNanos:J

    :cond_1
    return-object p0
.end method

.method public bridge synthetic keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "keepalive timeout must be positive"

    .line 272
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 273
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeoutNanos:J

    .line 274
    invoke-static {p1, p2}, Lio/grpc/internal/KeepAliveManager;->clampKeepAliveTimeoutInNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->keepAliveTimeoutNanos:J

    return-object p0
.end method

.method public bridge synthetic maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "max connection age must be positive: %s"

    .line 230
    invoke-static {v0, v1, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 232
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeInNanos:J

    .line 233
    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->AS_LARGE_AS_INFINITE:J

    cmp-long p3, p1, v0

    if-ltz p3, :cond_1

    const-wide p1, 0x7fffffffffffffffL

    .line 234
    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeInNanos:J

    .line 236
    :cond_1
    iget-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeInNanos:J

    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->MIN_MAX_CONNECTION_AGE_NANO:J

    cmp-long p3, p1, v0

    if-gez p3, :cond_2

    .line 237
    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeInNanos:J

    :cond_2
    return-object p0
.end method

.method public bridge synthetic maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "max connection age grace must be non-negative: %s"

    .line 252
    invoke-static {v0, v1, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 254
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeGraceInNanos:J

    .line 255
    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->AS_LARGE_AS_INFINITE:J

    cmp-long p3, p1, v0

    if-ltz p3, :cond_1

    const-wide p1, 0x7fffffffffffffffL

    .line 256
    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionAgeGraceInNanos:J

    :cond_1
    return-object p0
.end method

.method public bridge synthetic maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "max connection idle must be positive: %s"

    .line 210
    invoke-static {v0, v1, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 212
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    .line 213
    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->AS_LARGE_AS_INFINITE:J

    cmp-long p3, p1, v0

    if-ltz p3, :cond_1

    const-wide p1, 0x7fffffffffffffffL

    .line 214
    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    .line 216
    :cond_1
    iget-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    sget-wide v0, Lio/grpc/okhttp/OkHttpServerBuilder;->MIN_MAX_CONNECTION_IDLE_NANO:J

    cmp-long p3, p1, v0

    if-gez p3, :cond_2

    .line 217
    iput-wide v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxConnectionIdleInNanos:J

    :cond_2
    return-object p0
.end method

.method public bridge synthetic maxInboundMessageSize(I)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1}, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMessageSize(I)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxInboundMessageSize(I)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 2

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "negative max bytes"

    .line 367
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 368
    iput p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMessageSize:I

    return-object p0
.end method

.method public bridge synthetic maxInboundMetadataSize(I)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1}, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMetadataSize(I)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxInboundMetadataSize(I)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 2

    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "maxInboundMetadataSize must be > 0"

    .line 350
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 351
    iput p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->maxInboundMetadataSize:I

    return-object p0
.end method

.method public bridge synthetic permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "permit keepalive time must be non-negative: %s"

    .line 294
    invoke-static {v0, v1, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 296
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveTimeInNanos:J

    return-object p0
.end method

.method public bridge synthetic permitKeepAliveWithoutCalls(Z)Lio/grpc/ServerBuilder;
    .locals 0

    .line 69
    invoke-virtual {p0, p1}, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveWithoutCalls(Z)Lio/grpc/okhttp/OkHttpServerBuilder;

    move-result-object p1

    return-object p1
.end method

.method public permitKeepAliveWithoutCalls(Z)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 0

    .line 309
    iput-boolean p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->permitKeepAliveWithoutCalls:Z

    return-object p0
.end method

.method public scheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 2

    .line 332
    new-instance v0, Lio/grpc/internal/FixedObjectPool;

    const-string v1, "scheduledExecutorService"

    .line 333
    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v0, p1}, Lio/grpc/internal/FixedObjectPool;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->scheduledExecutorServicePool:Lio/grpc/internal/ObjectPool;

    return-object p0
.end method

.method setStatsEnabled(Z)V
    .locals 1

    .line 373
    iget-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->serverImplBuilder:Lio/grpc/internal/ServerImplBuilder;

    invoke-virtual {v0, p1}, Lio/grpc/internal/ServerImplBuilder;->setStatsEnabled(Z)V

    return-void
.end method

.method setTransportTracerFactory(Lio/grpc/internal/TransportTracer$Factory;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 0

    .line 150
    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->transportTracerFactory:Lio/grpc/internal/TransportTracer$Factory;

    return-object p0
.end method

.method public socketFactory(Ljavax/net/ServerSocketFactory;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 0

    if-nez p1, :cond_0

    .line 175
    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->socketFactory:Ljavax/net/ServerSocketFactory;

    goto :goto_0

    .line 177
    :cond_0
    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->socketFactory:Ljavax/net/ServerSocketFactory;

    :goto_0
    return-object p0
.end method

.method public transportExecutor(Ljava/util/concurrent/Executor;)Lio/grpc/okhttp/OkHttpServerBuilder;
    .locals 1

    if-nez p1, :cond_0

    .line 162
    sget-object p1, Lio/grpc/okhttp/OkHttpServerBuilder;->DEFAULT_TRANSPORT_EXECUTOR_POOL:Lio/grpc/internal/ObjectPool;

    iput-object p1, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->transportExecutorPool:Lio/grpc/internal/ObjectPool;

    goto :goto_0

    .line 164
    :cond_0
    new-instance v0, Lio/grpc/internal/FixedObjectPool;

    invoke-direct {v0, p1}, Lio/grpc/internal/FixedObjectPool;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/grpc/okhttp/OkHttpServerBuilder;->transportExecutorPool:Lio/grpc/internal/ObjectPool;

    :goto_0
    return-object p0
.end method
