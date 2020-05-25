class Restos {
    int id;
    String tipo;
    String http;
    String name;
    String description;
    String image;
    String logo;
    int distancia;
    int category;

    // Restos(String s, {
    //     this.id,
    //     this.tipo,
    //     this.http,
    //     this.name,
    //     this.description,
    //     this.image,
    //     this.logo,
    //     this.distancia,
    //     this.category,
    // });
    Restos(
        this.id,
        this.tipo,
        this.http,
        this.name,
        this.description,
        this.image,
        this.logo,
        this.distancia,
        this.category,
    );

    // factory Restos.fromJson(Map<String, dynamic> json) => Restos(
    //     id: json["id"],
    //     tipo: json["tipo"],
    //     http: json["http"],
    //     name: json["name"],
    //     description: json["description"],
    //     image: json["image"],
    //     logo: json["logo"],
    //     logo: json["logodistancia,
    //     category: json["category"],
    // );
}