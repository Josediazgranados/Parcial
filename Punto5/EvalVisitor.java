@Override
public Double visitMaclaurinExpr(CalcpruParser.MaclaurinExprContext ctx) {
    double x = visit(ctx.expr()); // valor de x
    int n = Integer.parseInt(ctx.INT().getText()); // número de términos

    double result = 0.0;
    for (int i = 0; i <= n; i++) {
        result += Math.pow(x, i) / factorial(i);
    }
    return result;
}

private double factorial(int k) {
    if (k == 0 || k == 1) return 1.0;
    double res = 1.0;
    for (int i = 2; i <= k; i++) {
        res *= i;
    }
    return res;
}

