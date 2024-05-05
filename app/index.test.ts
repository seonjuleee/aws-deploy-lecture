import request from "supertest";
import { App } from "supertest/types";
import { createApp } from ".";

let app: App;

beforeAll(async () => {
    app = await createApp();
});

describe("POST /messages", () => {
    it("responds with a success message", async () => {
        const response = await request(app)
            .post("/messages")
            .send({ message: "testing with redis" });

        expect(response.statusCode).toBe(200);
        expect(response.text).toBe("Message added to list.");
    });
});

describe("GET /messages", () => {
    it("responds with all message", async () => {
        const response = await request(app).get("/messages");

        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual([]);
    });
});
