export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.pathname === "/v1/mars/weather/today") {
      // TODO: Replace with real Mars data fetch. For now, return normalized mock.
      const payload = {
        sol: 1234,
        season: "Northern Fall",
        tempMinC: -85,
        tempMaxC: -55,
        pressurePa: 760,
        windAvgMps: 5,
        source: "mock",
        fetchedAt: new Date().toISOString()
      };
      return new Response(JSON.stringify(payload), {
        headers: { "content-type": "application/json; charset=utf-8",
                   "cache-control": "public, max-age=3600" }
      });
    }
    return new Response("OK", { status: 200 });
  }
}
