USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 3/8/2023 15:35:41 ******/
CREATE DATABASE [PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadORT', N'ON'
GO
ALTER DATABASE [PreguntadORT] SET QUERY_STORE = OFF
GO
USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 3/8/2023 15:35:42 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/8/2023 15:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 3/8/2023 15:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultad] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/8/2023 15:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[FK_IdCategoria] [int] NOT NULL,
	[FK_IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/8/2023 15:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[FK_IdPregunta] [int] NOT NULL,
	[Opcion] [varchar](1) NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Deportes', N'deportes.avif')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Historia', N'Historia.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Música', N'Musica.avif')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Autos', N'Autos.jpg')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (1, 2, 1, N'¿Cuál de estos deportes se juega con un balón de fútbol?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (2, 2, 1, N'¿En qué deporte se utiliza un palo y una pelota pequeña llamada "golf ball"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (3, 2, 1, N'¿Cuál de los siguientes deportes se practica en el agua y requiere una tabla?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (4, 2, 1, N'¿En qué deporte el objetivo es meter una pequeña pelota blanca en un hoyo utilizando un palo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (5, 2, 1, N'¿Cuál de los siguientes deportes se juega en una pista ovalada y los participantes usan patines?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (6, 2, 2, N'¿En qué deporte se utilizan arcos y flechas para disparar a un objetivo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (7, 2, 2, N'¿Qué deporte involucra lanzar un disco metálico en una pista y buscar la mayor distancia posible?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (8, 2, 2, N'¿Cuál de los siguientes países es famoso por sus logros en el hockey sobre hielo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (9, 2, 2, N'¿Cuál de estos eventos deportivos se celebra cada cuatro años y reúne a atletas de todo el mundo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (10, 2, 2, N'¿En qué deporte se realiza una competencia en la que los participantes deben nadar, andar en bicicleta y correr en secuencia?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (11, 2, 3, N'¿En qué año se celebró la primera Copa Mundial de Fútbol?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (12, 2, 3, N'¿Cuál es el deporte nacional de Canadá?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (13, 2, 3, N'¿Qué equipo de fútbol ha ganado la mayor cantidad de Copas UEFA Champions League hasta la fecha?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (14, 2, 3, N'¿Quién es el atleta con más medallas olímpicas en la historia de los Juegos Olímpicos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (15, 2, 3, N'¿Cuál es el récord mundial actual en el evento de salto de altura masculino?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (16, 3, 1, N'¿En qué año ocurrió la Revolución Francesa?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (17, 3, 1, N'¿Quién fue el primer presidente de los Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (18, 3, 1, N'¿En qué continente se originó la antigua civilización egipcia?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (19, 3, 1, N'¿Cuál fue la batalla final que determinó la caída del Imperio Romano de Occidente?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (20, 3, 1, N'¿Qué famoso líder pacifista luchó por los derechos civiles de los afroamericanos en Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (21, 3, 2, N'¿Qué evento histórico desencadenó la Primera Guerra Mundial?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (22, 3, 2, N'¿Cuál de las siguientes civilizaciones antiguas fue conocida por su código legal?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (23, 3, 2, N'¿Qué famosa ruta comercial conectó el este de Asia con Europa durante la antigüedad?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (24, 3, 2, N'¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (25, 3, 2, N'¿Cuál fue el nombre del programa espacial de la Unión Soviética que puso al primer ser humano en el espacio?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (26, 3, 3, N'¿Qué líder político y militar fue el dictador de Alemania durante la Segunda Guerra Mundial?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (27, 3, 3, N'¿Cuándo comenzó la Revolución Industrial en Gran Bretaña?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (28, 3, 3, N'¿Qué imperio se conoce como el Imperio de los Mil Años y tuvo su centro en Europa central?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (29, 3, 3, N'¿Qué líder militar conquistó gran parte de Europa y Asia en el siglo XIII?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (30, 3, 3, N'¿Qué tratado puso fin a la Primera Guerra Mundial?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (31, 4, 1, N'¿Quién es conocido como el "Rey del Pop"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (32, 4, 1, N'¿Qué instrumento toca un violinista?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (33, 4, 1, N'¿Cuál de las siguientes bandas es conocida por su álbum "Sgt. Pepper\s Lonely Hearts Club Band"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (34, 4, 1, N'¿Cuál es el nombre del himno nacional de Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (35, 4, 1, N'¿Qué famoso guitarrista fue miembro de la banda británica "The Rolling Stones"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (36, 4, 2, N'¿Cuál de las siguientes canciones es de la banda de rock "Queen"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (37, 4, 2, N'¿Qué instrumento musical utiliza pedales para cambiar el tono del sonido?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (38, 4, 2, N'¿Quién es el famoso compositor de música clásica conocido por su obra "Für Elise"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (39, 4, 2, N'¿Qué estilo de música nació en Jamaica y se caracteriza por su ritmo y mensaje social?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (40, 4, 2, N'¿Qué instrumento de percusión se toca con baquetas?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (41, 4, 3, N'¿Qué compositor austríaco es famoso por su "Réquiem" y "La flauta mágica"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (42, 4, 3, N'¿Qué famoso álbum de los Beatles presenta la icónica portada con los cuatro integrantes cruzando un paso de cebra?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (43, 4, 3, N'¿Cuál de los siguientes cantantes es conocido como el "Rey del Rock and Roll"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (44, 4, 3, N'¿Qué famoso director de orquesta y compositor austrohúngaro es conocido por su obra "El Danubio Azul"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (45, 4, 3, N'¿Qué banda británica es conocida por su álbum conceptual "The Dark Side of the Moon"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (46, 5, 1, N'¿Qué empresa fabrica el modelo de automóvil "Mustang"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (47, 5, 1, N'¿Cuál de estos elementos se utiliza para medir la velocidad de un automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (48, 5, 1, N'¿Cuál de estos tipos de vehículos es conocido por ser más adecuado para circular fuera de carretera?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (49, 5, 1, N'¿Qué significan las siglas SUV en el contexto de los automóviles?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (50, 5, 1, N'¿Qué opción se refiere a un sistema que evita que las ruedas del automóvil patinen durante la aceleración?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (51, 5, 2, N'¿Cuál de las siguientes marcas de automóviles es originaria de Alemania?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (52, 5, 2, N'¿Qué automóvil es conocido como el "Escarabajo" en algunos países?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (53, 5, 2, N'¿Qué siglas representan al sistema de frenos antibloqueo en los automóviles?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (54, 5, 2, N'¿Qué tipo de motor utiliza gasolina y electricidad para propulsar el automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (55, 5, 2, N'¿Cuál de estos componentes del automóvil permite cambiar de marcha para aumentar o disminuir la velocidad?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (56, 5, 3, N'¿Cuál de los siguientes fabricantes de automóviles es conocido por producir automóviles eléctricos de alta gama?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (57, 5, 3, N'¿Qué famosa competencia de automovilismo se celebra anualmente en Mónaco?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (58, 5, 3, N'¿Qué tipo de motor utiliza el combustible diésel para propulsar el automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (59, 5, 3, N'¿Cuál de los siguientes modelos de lujo es producido por la marca Rolls-Royce?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (60, 5, 3, N'¿Cuál es la velocidad máxima alcanzada por el famoso automóvil Bugatti Veyron?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (61, 5, 1, N'¿Qué empresa fabrica el modelo de automóvil "Mustang"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (62, 5, 1, N'¿Cuál de estos elementos se utiliza para medir la velocidad de un automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (63, 5, 1, N'¿Cuál de estos tipos de vehículos es conocido por ser más adecuado para circular fuera de carretera?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (64, 5, 1, N'¿Cuál de las siguientes opciones se refiere a un sistema que evita que las ruedas del automóvil patinen durante la aceleración?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (65, 5, 1, N'¿Qué significan las siglas SUV en el contexto de los automóviles?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (66, 5, 2, N'¿Cuál de las siguientes marcas de automóviles es originaria de Alemania?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (67, 5, 2, N'¿Qué automóvil es conocido como el "Escarabajo" en algunos países?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (68, 5, 2, N'¿Qué siglas representan al sistema de frenos antibloqueo en los automóviles?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (69, 5, 2, N'¿Qué tipo de motor utiliza gasolina y electricidad para propulsar el automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (70, 5, 2, N'¿Cuál de estos componentes del automóvil permite cambiar de marcha para aumentar o disminuir la velocidad?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (71, 5, 3, N'¿Cuál de los siguientes fabricantes de automóviles es conocido por producir automóviles eléctricos de alta gama?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (72, 5, 3, N'¿Qué famosa competencia de automovilismo se celebra anualmente en Mónaco?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (73, 5, 3, N'¿Qué tipo de motor utiliza el combustible diésel para propulsar el automóvil?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (74, 5, 3, N'¿Cuál de los siguientes modelos de lujo es producido por la marca Rolls-Royce?')
INSERT [dbo].[Preguntas] ([IdPregunta], [FK_IdCategoria], [FK_IdDificultad], [Enunciado]) VALUES (75, 5, 3, N'¿Cuál es la velocidad máxima alcanzada por el famoso automóvil Bugatti Veyron?')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, N'c', N'Fútbol', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (2, 1, N'a', N'Tenis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 1, N'b', N'Baloncesto', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (4, 1, N'd', N'Golf', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 2, N'a', N'Golf', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 2, N'b', N'Béisbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 2, N'c', N'Hockey sobre hielo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 2, N'd', N'Balonmano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 3, N'b', N'Surf', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 3, N'a', N'Patinaje artístico', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 3, N'c', N'Ciclismo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 3, N'd', N'Esgrima', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 4, N'c', N'Golf', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 4, N'a', N'Tenis de mesa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 4, N'b', N'Fútbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 4, N'd', N'Voleibol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 5, N'c', N'Patinaje de velocidad', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 5, N'a', N'Atletismo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 5, N'b', N'Ciclismo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 5, N'd', N'Fútbol americano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 6, N'a', N'Tiro con arco', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 6, N'b', N'Esgrima', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 6, N'c', N'Béisbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 6, N'd', N'Rugby', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 7, N'a', N'Lanzamiento de disco', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 7, N'b', N'Salto con pértiga', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 7, N'c', N'Lucha libre', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 7, N'd', N'Patinaje artístico', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 8, N'a', N'Italia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 8, N'b', N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 8, N'c', N'Brasil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 8, N'd', N'México', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 9, N'a', N'Copa Mundial de Fútbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 9, N'b', N'Juegos Olímpicos', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 9, N'c', N'Mundial de Rugby', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 9, N'd', N'Super Bowl', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 10, N'a', N'Atletismo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (38, 10, N'b', N'Triatlón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 10, N'c', N'Salto de longitud', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 10, N'd', N'Boxeo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (41, 11, N'a', N'1930', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 11, N'b', N'1950', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 11, N'c', N'1970', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (44, 11, N'd', N'1990', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 12, N'a', N'Hockey sobre hielo', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (46, 12, N'b', N'Fútbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (47, 12, N'c', N'Béisbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (48, 12, N'd', N'Baloncesto', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (49, 13, N'a', N'FC Barcelona', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (50, 13, N'b', N'Liverpool FC', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (51, 13, N'c', N'Real Madrid CF', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (52, 13, N'd', N'Manchester United FC', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (53, 14, N'a', N'Usain Bolt', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (54, 14, N'b', N'Michael Phelps', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (55, 14, N'c', N'Carl Lewis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (56, 14, N'd', N'Jesse Owens', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (57, 15, N'a', N'2.40 metros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (58, 15, N'b', N'2.45 metros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (59, 15, N'c', N'2.58 metros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (60, 15, N'd', N'2.63 metros', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (61, 16, N'b', N'1789', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (62, 16, N'a', N'1776', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (63, 16, N'c', N'1812', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (64, 16, N'd', N'1917', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (65, 17, N'b', N'George Washington', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (66, 17, N'a', N'Abraham Lincoln', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (67, 17, N'c', N'Thomas Jefferson', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (68, 17, N'd', N'Benjamin Franklin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (69, 18, N'b', N'África', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (70, 18, N'a', N'Asia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (71, 18, N'c', N'Europa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (72, 18, N'd', N'América', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (73, 19, N'd', N'Batalla de Adrianópolis', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (74, 19, N'a', N'Batalla de Waterloo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (75, 19, N'b', N'Batalla de las Termópilas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (76, 19, N'c', N'Batalla de Alesia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (77, 20, N'a', N'Martin Luther King Jr.', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (78, 20, N'b', N'Mahatma Gandhi', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (79, 20, N'c', N'Nelson Mandela', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (80, 20, N'd', N'Abraham Lincoln', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (81, 21, N'a', N'Asesinato de Franz Ferdinand', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (82, 21, N'b', N'Caída de la Bastilla', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (83, 21, N'c', N'Revolución Rusa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (84, 21, N'd', N'Declaración de Independencia de Estados Unidos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (85, 22, N'c', N'Mesopotamia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (86, 22, N'a', N'Egipto', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (87, 22, N'b', N'Grecia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (88, 22, N'd', N'China', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (89, 23, N'a', N'Ruta de la Seda', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (90, 23, N'b', N'Ruta del Oro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (91, 23, N'c', N'Ruta del Incienso', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (92, 23, N'd', N'Ruta de las Especias', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (93, 24, N'a', N'1776', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (94, 24, N'b', N'1787', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (95, 24, N'c', N'1791', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (96, 24, N'd', N'1804', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (97, 25, N'c', N'Vostok', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (98, 25, N'a', N'Proyecto Apolo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (99, 25, N'b', N'Programa Soyuz', 0)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (100, 25, N'd', N'Sputnik', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (101, 26, N'd', N'Adolf Hitler', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (102, 26, N'b', N'Benito Mussolini', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (103, 26, N'a', N'Joseph Stalin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (104, 26, N'c', N'Winston Churchill', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (105, 27, N'c', N'Siglo XVIII', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (106, 27, N'a', N'Siglo XV', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (107, 27, N'b', N'Siglo XVI', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (108, 27, N'd', N'Siglo XIX', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (109, 28, N'd', N'Sacro Imperio Romano Germánico', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (110, 28, N'a', N'Imperio Romano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (111, 28, N'b', N'Imperio Persa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (112, 28, N'c', N'Imperio Bizantino', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (113, 29, N'c', N'Genghis Khan', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (114, 29, N'a', N'Julio César', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (115, 29, N'b', N'Alejandro Magno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (116, 29, N'd', N'Napoleón Bonaparte', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (117, 30, N'a', N'Tratado de Versalles', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (118, 30, N'b', N'Tratado de Tordesillas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (119, 30, N'c', N'Tratado de Westfalia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (120, 30, N'd', N'Tratado de Viena', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (121, 31, N'b', N'Michael Jackson', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (122, 31, N'a', N'Elvis Presley', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (123, 31, N'c', N'Freddie Mercury', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (124, 31, N'd', N'Madonna', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (125, 32, N'c', N'Violín', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (126, 32, N'a', N'Guitarra', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (127, 32, N'b', N'Piano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (128, 32, N'd', N'Batería', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (129, 33, N'c', N'The Beatles', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (130, 33, N'a', N'The Rolling Stones', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (131, 33, N'b', N'Queen', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (132, 33, N'd', N'Led Zeppelin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (133, 34, N'd', N'The Star-Spangled Banner', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (134, 34, N'a', N'God Save the Queen', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (135, 34, N'b', N'La Marseillaise', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (136, 34, N'c', N'O Canada', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (137, 35, N'c', N'Keith Richards', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (138, 35, N'a', N'Eric Clapton', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (139, 35, N'b', N'Jimmy Page', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (140, 35, N'd', N'Jimi Hendrix', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (141, 36, N'a', N'Bohemian Rhapsody', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (142, 36, N'b', N'Purple Haze', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (143, 36, N'c', N'Stairway to Heaven', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (144, 36, N'd', N'Like a Rolling Stone', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (145, 37, N'c', N'Guitarra eléctrica', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (146, 37, N'a', N'Saxofón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (147, 37, N'b', N'Trompeta', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (148, 37, N'd', N'Piano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (149, 38, N'b', N'Ludwig van Beethoven', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (150, 38, N'a', N'Johann Sebastian Bach', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (151, 38, N'c', N'Wolfgang Amadeus Mozart', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (152, 38, N'd', N'Franz Schubert', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (153, 39, N'a', N'Reggae', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (154, 39, N'b', N'Salsa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (155, 39, N'c', N'Hip-hop', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (156, 39, N'd', N'Jazz', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (157, 40, N'b', N'Batería', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (158, 40, N'a', N'Flauta', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (159, 40, N'c', N'Violonchelo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (160, 40, N'd', N'Piano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (161, 41, N'c', N'Wolfgang Amadeus Mozart', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (162, 41, N'a', N'Franz Liszt', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (163, 41, N'b', N'Johannes Brahms', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (164, 41, N'd', N'Gustav Mahler', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (165, 42, N'd', N'Abbey Road', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (166, 42, N'a', N'Help!', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (167, 42, N'b', N'Rubber Soul', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (168, 42, N'c', N'Revolver', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (169, 43, N'd', N'Elvis Presley', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (170, 43, N'b', N'Little Richard', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (171, 43, N'c', N'Buddy Holly', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (172, 43, N'a', N'Chuck Berry', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (173, 44, N'd', N'Johann Strauss II', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (174, 44, N'a', N'Richard Wagner', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (175, 44, N'b', N'Johannes Brahms', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (176, 44, N'c', N'Franz Schubert', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (177, 45, N'c', N'Pink Floyd', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (178, 45, N'a', N'The Rolling Stones', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (179, 45, N'b', N'Led Zeppelin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (180, 45, N'd', N'The Who', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (181, 46, N'a', N'Chevrolet', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (182, 46, N'b', N'Ford', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (183, 46, N'c', N'Toyota', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (184, 46, N'd', N'Honda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (185, 47, N'a', N'Tacómetro', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (186, 47, N'b', N'Termómetro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (187, 47, N'c', N'Odómetro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (188, 47, N'd', N'Voltímetro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (189, 48, N'a', N'Sedán', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (190, 48, N'b', N'Camioneta', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (191, 48, N'c', N'Coupé', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (192, 48, N'd', N'Hatchback', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (193, 49, N'a', N'Control de crucero', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (194, 49, N'b', N'Control de tracción', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (195, 49, N'c', N'Control de estabilidad', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (196, 49, N'd', N'Control de frenado', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (197, 50, N'a', N'Super Urban Vehicle', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (198, 50, N'b', N'Sport Utility Vehicle', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (199, 50, N'c', N'Small Utility Van', 0)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (200, 50, N'd', N'Special Utility Variant', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (201, 51, N'a', N'Toyota', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (202, 51, N'b', N'Honda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (203, 51, N'c', N'BMW', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (204, 51, N'd', N'Ford', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (205, 52, N'a', N'Volkswagen Beetle', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (206, 52, N'b', N'Ford Mustang', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (207, 52, N'c', N'Chevrolet Corvette', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (208, 52, N'd', N'Fiat 500', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (209, 53, N'a', N'ABS', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (210, 53, N'b', N'GPS', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (211, 53, N'c', N'RPM', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (212, 53, N'd', N'USB', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (213, 54, N'a', N'Motor diésel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (214, 54, N'b', N'Motor híbrido', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (215, 54, N'c', N'Motor de gasolina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (216, 54, N'd', N'Motor eléctrico', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (217, 55, N'a', N'Freno de mano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (218, 55, N'b', N'Palanca de cambios', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (219, 55, N'c', N'Pedal del acelerador', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (220, 55, N'd', N'Volante', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (221, 56, N'a', N'Nissan', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (222, 56, N'b', N'Tesla', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (223, 56, N'c', N'Honda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (224, 56, N'd', N'Kia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (225, 57, N'a', N'Rally Dakar', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (226, 57, N'b', N'Fórmula 1', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (227, 57, N'c', N'24 Horas de Le Mans', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (228, 57, N'd', N'NASCAR', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (229, 58, N'a', N'Motor de gasolina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (230, 58, N'b', N'Motor eléctrico', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (231, 58, N'c', N'Motor híbrido', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (232, 58, N'd', N'Motor diésel', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (233, 59, N'a', N'Phantom', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (234, 59, N'b', N'Mustang', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (235, 59, N'c', N'Corvette', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (236, 59, N'd', N'Prius', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (237, 60, N'a', N'300 km/h', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (238, 60, N'b', N'350 km/h', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (239, 60, N'c', N'400 km/h', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FK_IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (240, 60, N'd', N'450 km/h', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categoria] FOREIGN KEY([FK_IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categoria]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultad] FOREIGN KEY([FK_IdDificultad])
REFERENCES [dbo].[Dificultad] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultad]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([FK_IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
